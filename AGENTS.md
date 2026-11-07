# EdenSpark Game Project

## Documentation

Use the EdenSpark MCP server's `search_docs` tool to look up EdenSpark and Daslang documentation. If the docs index is unavailable, fall back to local documentation bundled with EdenSpark:

- **API reference (RST):** `C:/Users/MarySue/AppData/Local/EdenSpark/docs`

In case you couldn't find required functionality in documentation look into usages in samples bundled with EdenSpark:

- **Sample projects:** `C:/Users/MarySue/AppData/Local/EdenSpark/samples`

## Project Architecture

Follow this layered module structure — putting code in the wrong file is the most common source of refactor pain. Smaller projects can collapse some kinds of file, but the layering rules still apply.

### Recommended Module Layout

| Kind | Suggested filename | Holds | Never holds |
|------|--------------------|-------|-------------|
| Engine entry | `main.das` | `[export]` hooks (`on_initialize`, `on_update`, `on_resolution_changed`, etc.), `[cheat]` debug commands, scene-infrastructure construction (camera, lights, render settings, UI canvas, render targets) | Domain logic, per-entity per-frame work |
| Constants | `constants.das` | `let public UPPER_SNAKE` tunables only | `var`, mutable state, classes, helper functions |
| Mutable state | `game_state.das` (or `state.das`) | `var public camelCase` cross-module mutable state, scene-infrastructure NodeIds, world geometry constants shared across systems | Tunables, helpers, classes |
| Per-X data | e.g. `level_data.das`, `room_data.das` | A struct describing one slot of repeated state (one level, one room, one wave) plus a deep-move helper for slot rotation | Spawning logic, per-frame logic |
| Shared components | e.g. `components.das` | Small reusable Components used across multiple domain modules | Domain-specific Components |
| Math / utility | e.g. `ik.das`, `math.das` | Pure helpers, no scene side-effects | State, resource handles |
| Domain modules | one per system: `player.das`, `enemies.das`, `ai.das`, `pickups.das`, `world.das`, `collision.das`, `particles.das`, `sounds.das`, etc. | Controller Components, `spawn_*` factories, `load_*` resource requests, queries, system-local helpers | `[export]` engine hooks |

Modules form a one-way dependency graph: domain modules require shared utilities and state; `main.das` requires everything; nothing requires `main.das`. Avoid cycles — if you find one, the shared piece belongs in a lower layer (constants, state, or a helper module).

### Core Patterns

**1. Per-frame work belongs in a Component, not a global update loop.**

Every animated, AI-driven, or timer-based entity owns a Component with `def override on_update`. `main.das on_update` is reserved for cross-cutting passes that span entities (e.g. proximity collision checks, global state machines). New animated entity → new Component.

```das
class Thing : Component {
    timer : float = 0.0
    speed : float = 1.0

    def override on_update {
        let dt = get_delta_time()
        timer += dt
        // per-entity logic here
    }
}
```

**2. Resource loading is centralized at startup.**

Every prefab, material, texture, and sound has the same shape:

```das
// in the owning domain module
var public thingPrefab : PrefabId

def public load_thing_prefab() {
    thingPrefab = request_prefab("assets/thing.prefab")
}
```

Then call `load_thing_prefab()` once from `main.das on_initialize`. Never request resources lazily inside `on_update` or spawn paths.

**3. State separation is strict.**

| Kind of value | Where it lives | Convention |
|---------------|----------------|------------|
| Static tunable (radius, speed, duration, color) | constants module | `let public UPPER_SNAKE = ...` |
| Mutable runtime variable read by ≥2 modules | state module | `var public camelCase = ...` |
| Repeated slot of state (one level, one wave, one room) | per-X-data struct, instances stored in state module | array fields per entity category |
| Per-entity state | fields on the controller Component | |
| Module-private state | `var private` at module top | only visible inside that module |

Multiple values of the same kind go in one multiline declaration:
```
let public {
    UPPER_SNAKE = ...
    FOO = ...
}
```
A new tunable goes in the constants module, a new shared runtime variable in the state module - never inline in whichever domain module uses it first.

**4. Cross-module communication is via shared state, not back-references.**

Modules read and write the state module's globals. They do not import each other to call update methods, and they do not pass NodeIds "up" to `main`. The global update function does not iterate per-entity arrays — entities tick themselves through their Components.

**5. Engine entry points live only in `main.das`.**

- `[export] def on_initialize()` — call every `load_*()`, build scene infrastructure (camera, lights, render settings, render targets, UI canvas), spawn the player, spawn the initial slot of per-X state.
- `[export] def on_update()` — global state machine (menu / fade / play), then cross-cutting passes. Per-entity work happens in Components.
- `[export] def on_resolution_changed(res : int2)` — recreate render targets at the new dimensions, rescale camera-attached quads (store the original aspect at init and scale by `newAspect / initialAspect`), resize UI canvas frames. Anything sized to `get_resolution()` at init must be wired up here.
- `[cheat] def name()` — debug shortcuts callable from the editor console.

Domain modules never declare `[export]` functions.

**6. Spawn factories follow a consistent shape.**

```das
def public spawn_thing_into(var slot : XData; count : int) {
    for (i in range(count)) {
        let node = create_node(NodeData(position = ..., scale = ...))
        // or: instantiate_prefab(thingPrefab, NodeData(...))
        add_component(node, new Mesh(meshId = ..., color = ..., visibility = VIS_MAIN))
        add_component(node, new Thing(...))   // per-frame logic
        push(slot.thingNodes, node)
    }
}
```

The factory takes the slot it spawns into, builds node + components, and pushes into the appropriate slot array. Visibility is set explicitly. The controller Component owns per-entity state — no parallel module-level array of "current things" alongside the slot's array.

### Common Mistakes

The Core Patterns above cover *where* each kind of code goes; the traps below are the ones that bite even when you know the layering:

- **Aliasing scalar fields during slot deep-move** — copy then explicitly zero `NodeId` and primitive fields on the source, or both slots reference the same node and a later sweep on one mutates the other.
- **Lazy resource loads inside `on_update` or a spawn path** — always centralize in a `load_*()` called from `on_initialize`; lazy loads cause first-use hitches and murky lifetimes.
- **UI / scene meshes sized to `get_resolution()` without wiring `on_resolution_changed`** — they must be rebuilt or rescaled on resize.
- **Back-references between modules** (importing each other to call update methods, passing NodeIds back to main) — communicate only through the state module; expose what's needed there rather than adding a back-reference.
- **Wrong texture filter/addressing** — edge bleed, shimmer. Pixel/2D → `Point`+`Clamp`, 3D material textures → `Bilinear`+`Wrap`, set in each `<texture>.png.meta`. See **Textures — Filtering & Addressing**.

## Language: Gen2 daScript

Eden user scripts use Gen2 daScript — a statically typed language with C-like braces `{}` and parentheses `()` (not the original indentation-based syntax).

## Core Syntax Rules

### Braces and Parentheses — Always Required
- Functions ALWAYS use braces: `def foo() { ... }`
- Conditions ALWAYS use parentheses AND braces: `if (x > 0) { ... } elif (x == 0) { ... } else { ... }`
- Loops ALWAYS use parentheses AND braces: `for (i in range(10)) { ... }`, `while (condition) { ... }`

### Variables
- `let` for immutable, `var` for mutable
- Module-level constants: `UPPER_SNAKE_CASE`
- Prefer `let` over `var` when value won't change

### Type Annotations
Type annotations use `:` after the name. Optional when type can be inferred: `let x : int = 5`, `var nodes : array<NodeId>`, `var arr : NodeId[15]` (fixed-size)

### Functions
- `def name(params) : ReturnType { ... }` — return type optional when inferrable
- Default values: `def setup(speed : float = 1.0) { ... }`
- Generic/untyped parameter: `def set_status(str) { ... }` (type inferred)

### String Interpolation
Use `{}` inside string literals: `print("position: {position}")`, `text.text = "{get_current_score()}"`

### Modules and Imports
- `require engine.core` — import engine modules
- `require MyModule` — import local modules (same project)
- `module mod` — declare a module (comes after `require` statements)
- `module trackSegmentGen public` — `public` re-exports imports

### Export Annotation
Functions called by the engine must have `[export]`: `[export] def on_initialize() { ... }`

## Type System

### Primitive Types
`int`, `uint`, `float`, `double`, `bool`, `string`

### Vector/Math Types
`float2`, `float3`, `float4`, `int2`, `int3`, `uint3`, `quat4`

### Constructors
- `float3(0)` — shorthand for `float3(0, 0, 0)`
- `quat4(0, PI * 0.3f, 0)` — euler angles in radians
- Both `1.0` and `1f` are float literals; `2.1lf` is double

### Arrays
- Dynamic: `var cubes : array<NodeId>`, use `resize()`, `push()`
- Fixed-size: `var arr : NodeId[15]`
- Literal with move: `var arr <- [a, b, c]`
- `fixed_array(...)` for typed fixed arrays

### Tables (Hash Maps)
`var map <- { "key" => value }`, access with `map.get_value(key)`

### Structs
`struct Name { field : type = default }`, construct with `Name()` or `Name(field = val)`

### Enums
`enum Name { Value1 = 0, Value2 = 1 }`, access with `Name.Value1`

### Move Semantics
Use `<-` for move assignment (transfers ownership): `return <- mesh`, `var bitmap <- Bitmap(w, h)`

## Classes and Components

### Component Classes
Components inherit from `Component`, attach to scene nodes. Override `on_initialize`, `on_update`, `on_destroy`. Fields are public/serialized by default.

### Visibility Modifiers
- `private` — private field or method
- `@no_export` — field not serialized to prefab
- Methods can be `public`, `private`, `abstract`

### Collision Listeners
Inherit from `CollisionListener`, override `on_collision(c : Collision)`, `on_collision_stay(c : Collision)`, `on_collision_exit(node : NodeId)`

### Method Syntax
Methods can omit `()` when no parameters: `def override on_update { ... }`

## Control Flow

- `if / elif / else` — note: `elif` not `else if`
- `for (i in range(10)) { }`, `for (i in 0 .. n) { }` (half-open range)
- Multiple iterators (zip): `for (node, i in nodes, count()) { }`
- Ternary: `let val = (cond ? a : b)`
- Variant matching: `if (cmd is Type) { let x = cmd as Type; ... }`

## Blocks and Lambdas

- **Blocks** (capture by reference): `$(args) { body }` — used as last argument after `)`
- **Lambdas** (function pointers, no capture): `@@(args) { body }`
- **Closures** (capture outer vars): `@(args) { body }`
- No-arg lambda: `@() { ... }`
- Block as last argument goes after closing `)`: `get_component(nodeId) $(var mesh : Mesh?) { ... }`

## Scene API Patterns

### Creating Nodes
`create_node()` or `create_node(NodeData(name = "cube", position = ..., rotation = ..., parent = ..., scale = ...))`

### Adding Components
`add_component(node, new Mesh(meshId = CUBE_MESH_ID))` — returns component pointer. Method syntax: `node.add_component(...)`

### Getting Components
- Block-based (safe): `get_component(nodeId) $(var text : UIText?) { ... }`
- Type-based: `var cam = get_component(node, type<Camera>)`
- Safe navigation: `var cam = node?.Camera`
- Require (creates if missing): `require_component(node, type<Camera>)`
- Find globally: `find_component(type<UICanvas>)`, `find_components(type<Mesh>)` (also works with a user-defined Component type), `find_components(array)`

### Node Properties
- Position/rotation/scale: `nodeId.localPosition`, `nodeId.worldPosition`, `nodeId.localRotation`, `nodeId.localScale`
- `nodeId.name`, `nodeId.isActive`, `nodeId.isAlive`, `nodeId.parent`
- `set_position(node, pos)`, `set_scale(node, scale)`
- Parenting: `nodeId.set_parent(parent, AddChildStrategy.KeepLocalTransform)`
- Children: `nodeId.get_children()`, `get_child(node, index)`
- `remove_node(nodeId)`, `duplicate_node(original, NodeData(...))`

### Prefabs
`request_prefab("path.prefab")` then `instantiate_prefab(prefab, NodeData(...))`

## BLK File Format

BLK is EdenSpark's internal text data format (Dagor's DataBlock). Nearly every non-script data file in a project uses it, so recognize it on sight:

- `*.prefab` — scenes and prefabs (an application schema on top of BLK; see the **prefab-format** skill before hand-editing)
- `*.material` — materials
- `*.meta` — sidecar metadata next to every asset (textures, prefabs, shaders, sounds, ...): GUID, asset type, import settings
- `manifest.blk` — project settings

A BLK file is a tree of blocks. Each block holds an ordered list of parameters (typed key/value pairs) followed by an ordered list of child blocks. Order is significant and is preserved by the serializer. A param's name is conventionally written as `name:type` (or just `name` when the type is undefined), and a block's name as `name{}`.

### Blocks

```
blockName{
  <params and child blocks>
}
```

- A block has a name (an identifier or a quoted string) immediately followed by `{`, then closed by `}`.
- Block names are not unique — sibling blocks/params may repeat the same name, making them an ordered list. E.g. many `node{}` blocks at the top level, or many `k` params inside a `ks{}` block.
- A block may contain both parameters and child blocks; parameters conventionally come first.
- The top level of a file is an implicit root block (no surrounding braces).
- EdenSpark writes one parameter or block per line with `\n` line endings without indentation. Closing braces are on their own line (except for the two cases below).
- Empty block is written on a single line: `i_am_empty{}`.
- A block with a single param is written on one line, with a semicolon after the param: `i_have_single_param{param:i=5;}`

### Parameters

A parameter is:

```
name:type=value
```

- `name` — an identifier.
- `type` — a short type tag.
- `value` — the textual value, format depends on the type.

The complete set of type tags (used by the serializer):

| Tag    | Type        | Value syntax                                         | Example                              |
|--------|-------------|------------------------------------------------------|--------------------------------------|
| `t`    | string      | quoted                                               | `name:t="pig"`                       |
| `i`    | int (32-bit)| decimal integer                                      | `uid:i=-894403327`                   |
| `r`    | real (float)| `%g` float                                           | `mass:r=1`, `k:r=3.43243e+08`        |
| `p2`   | Point2      | `x, y` (2 floats)                                    | `size:p2=1156, 550`                  |
| `p3`   | Point3      | `x, y, z` (3 floats)                                 | `pos:p3=0, 9.29289, -9.29289`        |
| `p4`   | Point4      | `x, y, z, w` (4 floats)                              | `rot:p4=0, 0, 0.707107, 0.707107`    |
| `ip2`  | IPoint2     | `x, y` (2 ints)                                      | `cell:ip2=3, 4`                      |
| `ip3`  | IPoint3     | `x, y, z` (3 ints)                                   | `coord:ip3=1, 2, 3`                  |
| `ip4`  | IPoint4     | `x, y, z, w` (4 ints)                                | `region:ip4=0, 0, 16, 16`            |
| `b`    | bool        | `yes` / `no`                                         | `isStatic:b=no`                      |
| `i64`  | int64       | decimal integer (64-bit)                             | `__meshId:i64=5696195008224956559`   |

There is no separate tag for unsigned, double, or for higher-dimension int vectors beyond the above — the application layer maps its field types onto these tags.

> `%g` float formatting. Floats are written with `printf("%g")`. This means values are rounded to ~6 significant digits and may use scientific notation (`3.43243e+08`). When editing, exact bit precision is not preserved on re-save; this is expected. If the float value is integral, the trailing `.` is omitted.

### String Values

Strings (type `t`) are quoted. The serializer chooses the quote style to minimize escaping:

- Single line, no `"`: double-quoted — `name:t="hello"`
- Contains `"` but no `'`: single-quoted — `text:t='say "hi"'`
- Contains a newline (`\n` or `\r`): triple-quoted, multi-line. The form is:

  ```
  description:t="""
  first line
  second line
  """
  ```

  A leading newline immediately after the opening `"""` is part of the delimiter. Triple-quoting uses `'''...'''` instead if the text contains `"` but not `'`.

Escaping inside ordinary (single-`"`/`'`) strings uses `~` as the escape character:

| Sequence | Meaning              |
|----------|----------------------|
| `~~`     | literal `~`          |
| `~"`     | literal `"`          |
| `~'`     | literal `'`          |
| `~n`     | newline (LF)         |
| `~r`     | carriage return (CR) |
| `~t`     | tab                  |

Inside triple-quoted strings, real newlines and tabs are written literally (not escaped); only `~~` and the matching quote char are escaped.

## Project Settings (manifest.blk)

Project-wide settings live in `manifest.blk` at the project root (BLK format, see above). The editor normally writes them via **Preferences → Project** tab, but they can also be edited by hand.

### Initial prefab
Which prefab opens when the project is entered and the game is launched.

```
defaultPrefab:t="<prefab-guid>"
```

- The value is the prefab's **GUID**, not its file path. Every prefab has a sidecar `<name>.prefab.meta` file whose first entry is the GUID — copy it from there.
- Set via UI: **Preferences → Project → Initial prefab**.
- **No editor restart needed** — takes effect the next time the project is opened.

### HD rendering
High-definition rendering for the project.

```
hdRendering:b=yes
```

- Defaults to `no` (omit the key to disable).
- Set via UI: **Preferences → Project → HD rendering**.
- **Restart the editor to apply changes** — the rendering scene is chosen once at startup, so toggling this mid-session does nothing until you restart. The UI shows a "Restart required" popup for the same reason.

## Annotations
- `[export]` — expose to engine
- `[cheat]` — register as cheat command
- `[hot_reload_class]` — class survives hot-reload

## Code Style Conventions

### Naming
- Variables/parameters: `camelCase`
- Functions: `snake_case` for utilities, `camelCase` for methods/callbacks
- Constants (module-level `let`): `UPPER_SNAKE_CASE`
- Classes/Structs/Enums: `PascalCase`
- Enum values: `PascalCase`

### Formatting
- 4 spaces indentation
- Opening brace on same line
- 2 blank lines between top-level functions; 1 between methods in a class
- `//` comments, `////` lines for section dividers

### Patterns
- UFCS: both `f(x)` and `x.f()` valid; pipe: `grid |> resize(n)`
- `inscope` for scoped lifetime: `var inscope children = nodeId.get_children()`
- String interpolation preferred over concatenation
- `pass` for empty bodies

## Known Gen2 Syntax Pitfalls

### No Semicolons Between Statements
Each statement must be on its own line. Semicolons between statements cause silent compilation failure.

### No Inline If-Braces for Vector/Struct Assignments
`if (cond) { var = float4(...) }` on a single line causes compilation failure for vector types. Always use multiline blocks.

### No Early Returns of Vector Types
Cannot use `if (x) { return float4(...) }`. Use a mutable variable with a single return at the end.

### Compilation Errors Are Often Silent
Engine reports "compilation failed" but error text is frequently empty/truncated. Debug by bisecting — comment out half the code until error is found.

### Enum/Bitfield Access Syntax
Use dot notation: `MeshVisibility.VisibleInAnyCamera`. Some engine enums use space syntax: `MouseButton Left` — try dot first.

## Deprecated Functions — Do Not Use

A subset of the engine API is marked deprecated. **You may not ship a game that calls a deprecated function** — the publish build fails the call as a hard error; in the editor it surfaces as a warning. If you find an existing project using one, replace it with the recommended alternative.

## Input — Action Sets

Bind logical actions (e.g. `"acceleration"`, `"jump"`, `"fire"`) to one or more physical inputs (keyboard keys, mouse buttons, gamepad sticks/buttons). The same action works across keyboard, mouse, and gamepad without per-frame edge-detection or per-device branching.

### Defining and Activating an Action Set
```das
def init_input() {
    add_and_activate_action_set("input", {
        "acceleration" => Action(
            axisActions = AxisAction(
                keyboardAxis = [
                    KeyboardBtnAxisInput(negativeIdx = KeyCode.S, positiveIdx = KeyCode.W),
                ],
                stickAxis = [GamepadAxisInput(idx = GamepadAxis.LThumbV)]
            )
        ),
        "jump" => Action(
            buttonActions = ButtonAction(
                keyboardButtons = [KeyboardButtonInput(idx = KeyCode.Space)],
                gamepadButtons = [GamepadButtonInput(idx = GamepadButton.A)],
            )
        )
    })
}
```
Call `init_input()` once from `on_initialize`.

`Action` is a variant — pick the field matching the input shape: `buttonActions` (digital, edge-detected), `axisActions` (1D ±1, plus unbounded `mouseMoveAxis`), `triggerActions` (1D 0..1), `joystickActions` (2D ±1), `pointerActions` (mouse cursor).

### Reading Actions Per Frame
- `get_action_axis("name") : float` — analog axis in `[-1, 1]` (sticks, or +1/-1/0 from keyboard pairs)
- `get_action_vector2("name") : float2` — 2D analog (sticks, or paired keyboard axes)
- `is_action_pressed("name", matchMode = ModifierMatchMode.Strong) : bool` — true while the current-frame value is non-default; works for all action types (button, axis, trigger, joystick, pointer); false on the release frame once the value returns to zero
- `is_action_just_pressed("name", matchMode = ModifierMatchMode.Strong) : bool` — true on the frame the action transitions from zero to non-zero; works for all action types except pointer `Accumulate` (logs an error and returns false)
- `is_action_just_released("name", matchMode = ModifierMatchMode.Strong) : bool` — true on the frame the action transitions from non-zero to zero; same type support and pointer `Accumulate` caveat as `is_action_just_pressed`
- `is_action_state_active("name", matchMode = ModifierMatchMode.Strong) : bool` — true while pressed OR on the release frame; for button actions, modifiers must still be held on the release frame. Stays true one extra frame after an axis/vector returns to zero.

`matchMode` applies to `is_action_state_active`, `is_action_pressed`, `is_action_just_pressed`, and `is_action_just_released` for button actions only: `ModifierMatchMode.Strong` (default) — extra held modifiers (Shift/Ctrl/Alt beyond what the action requires) block activation; `ModifierMatchMode.Weak` — extra modifiers are tolerated.

No manual previous-frame tracking — the action API gives you edges directly.

### Mouse Move Axis

Map raw mouse movement or scroll wheel to an `AxisAction` via `MouseMoveAxisInput`:

```das
"look" => Action(
    axisActions = AxisAction(
        mouseMoveAxis = [
            MouseMoveAxisInput(idx = MouseMoveAxis.Horizontal, sensitivity = 0.01),
        ]
    )
)
```

`MouseMoveAxis`: `Horizontal` (X delta), `Vertical` (Y delta), `Wheel` (scroll). Unlike other axis sources the value is **unbounded raw pixels/scroll-units per frame** — scale it down with `sensitivity` (e.g. `0.01`).

`MouseMoveAxisInput` fields: `idx : MouseMoveAxis`, `isInverted : bool = false`, `sensitivity : float = 1`.

To invert pointer deltas in a `PointerAction` (Delta mode only), set `MouseInput.isXInverted` or `isYInverted`:

```das
pointerActions = PointerAction(
    mouse = MouseInput(active = true, isXInverted = true, isYInverted = false),
    ...
)
```

Inversion has no effect in `Accumulate` mode.

### Mouse Position
Use `get_ui_mouse_position(nodeId)` on a child of a `UICanvas`. Returns `float3`: offset from viewport center, Y axis points DOWN. To convert to pixel coordinates, calibrate viewport center using `cam.worldToScreen(float3(0,0,0))` at init, then: `pixel = float2(uiPos.x + viewOffX, uiPos.y + viewOffY)`.

## Mesh Creation

- Sphere: `create_sphere_mesh(SphereInit(subdivisions = 24, radius = 0.5))`
- Cylinder: `create_cylinder_mesh(CylinderInit(height = 1.4, radius = 0.28))` — default axis Y
- Custom: `create_mesh(geo)` from `create_sphere_mesh_geometry(...)` (requires `engine.gen_geometry.mesh_structures`)
- Async completion: `create_mesh`/`update_mesh`/`generate_mesh` take an optional `on_ready` lambda (`@(id : MeshId) { ... }`), called once the request is processed. The same delivery contract applies to the whole async-callback surface: the collision async APIs (`create_mesh_collision_async`, `update_mesh_collision_async`, `create_heightmap_collision_async`) and `NavMesh.bakeAsync`.
- Callback delivery follows the operation that made the request, not the API: requests from game code (on_update, components, physics callbacks) deliver in game time - held while the app is paused, arriving right after unpause. Requests made by editor-driven calls - cheat/console command handlers, in-game ImGui callbacks, editor tools - deliver immediately, even on pause. Chained callbacks (an `on_ready` issuing the next request) inherit the policy of the operation that started the chain.
- Visibility: `node?.Mesh.visibility = MeshVisibility.VisibleInAnyCamera` (no shadows), `MeshVisibility.FullVisibility` (default)

## Physics / Ray Picking

### Collider Setup
`add_component(node, new Collider(shape = box_shape()))` — also `sphere_shape(radius=...)`, `cylinder_shape(radius=..., height=...)`. Colliders work without Mesh.

### Raycasting
`trace(RayCast(ray = ray)) $(hit) { ... }` — only detects nodes with Collider or RigidBody. Hit provides: `position`, `nodeId`, `normal`, `distance`. For all hits: `trace_all(rayCast) $(hits) { ... }`

## Navigation (NavMesh + NavCorridor)

Add a `NavMesh` component to a node, put `Collider` geometry under it, bake, then query walkable routes. The component carries the agent profile: `agentRadius`, `agentHeight`, `agentMaxClimb`, `agentMaxSlope`, `cellSize`, `cellHeight`.

```das
navNode.add_component(new NavMesh(agentRadius = 0.4, agentHeight = 1.8))
navNode?.NavMesh.bakeAsync() @(result : BakeResult) {
    // called when the bake finishes; do not assume it runs within this call
    // BakeResult.Baked = navmesh produced, .Empty = no walkable geometry (volume cleared), .Failed = bake could not run
}
```

Queries take a request struct and call a block with the result (mirrors `trace`); free functions query all baked navmeshes, the same-named `NavMesh` component methods only that volume's profile:

- `navmesh_find_path(NavPathQuery(from = a, to = b)) $(waypoints) {}` -> `PathResult.Full/Partial/NoPath` (`Partial` = goal unreachable, path stops at the closest reachable point)
- `navmesh_trace(NavRayCast(from = a, to = b)) $(hit) {}` — "can an agent walk this straight line"; block runs only when a wall blocks
- `navmesh_project_point(NavPointQuery(pos = p)) $(projected) {}` — snap a click/spawn position to the navmesh
- `navmesh_distance_to_wall(NavWallQuery(pos = p, maxRadius = r)) $(hit) {}`
- `navmesh_random_points_around_circle(NavCircleQuery(center = c, radius = r, count = n)) $(points) {}`, `navmesh_random_point(seed) $(pt) {}`

To actually WALK a route use the stateful `NavCorridor` — do not step through raw waypoints (agents wedge on navmesh borders):

```das
var corridor = NavCorridor()  // global: survives hot-reload
// repath: corridor.findPath(npc.localPosition, dest) != PathResult.NoPath
// every frame:
let corners <- corridor.corners(2)
let steerTo = length(corners) > 0 ? corners[0] : corridor.target
if (corridor.movePosition(npc.localPosition + step_toward(steerTo))) {
    npc.localPosition = corridor.position  // position/target are read-only properties
} else {
    corridor.findPath(npc.localPosition, dest)  // navmesh was rebaked -- replan
}
let arrived = corridor.distanceToGoal(1.0) <= 0.4
```

`moveTarget(want)` chases a moving goal without a full replan (refuses cross-storey jumps — replan with findPath); `optimize(corners[1])` a few times per second straightens the route. See the `navmesh` showcase for the full loop.

## Networking — Replicated Components

Requires `require engine.networking` (re-exported by `engine.core`); matching host and join also need `require engine.net.lobby`. The API reference documents every function, including which side it is for.

Mark a component `[replicated]` and the server's copy appears on every client, where it is a read-only replica.

```das
[replicated]
class Health : Component {
    hp : float = 100.0

    def override on_update {
        if (hasRemoteAuthority) {   // a replica: present the state, decide nothing
            return
        }
        hp = min(hp + 5.0 * get_delta_time(), 100.0)
        nodeId.localPosition += float3(0, 0, get_delta_time())   // reaches clients after set_transform_replication(nodeId, true)
    }
}
```

### Starting a session

- **Server** (`dedicated.das`): `eden-ded-dev.exe <project>/main.das --listen=:<port> -config:net/mainThreadNetwork:b=no`. Every `[replicated]` component in the scene then replicates: no dirty marking, nothing to register. A process with a live session keeps running unfocused.
- **Client** (`main.das`): `set_lobby_callbacks(...)`, then `open_lobby_menu()`; the connection starts from the tab. Wait for `has_network()`.
- Replicated nodes arrive as proxy nodes on their own, at the scene root with the authority's world transform when their parent does not replicate.

### What goes on the wire

- **Public fields of a `[replicated]` component replicate, `private` ones do not.** `@replicate` sends a private field, `@replicate = false` or `@no_replicate` keeps any field local; `@no_export` changes nothing here.
- The rule holds at any depth inside the component, nested structs included. A local field keeps each peer's own value, the place for client-side tracking.
- Fields with no wire form are skipped silently: component pointers, tables, variants, lambdas.
- A `NodeId` replicates as is, so peers hold identical ids for one node. One naming a node this client does not mirror arrives verbatim; check `node.isAlive`.
- **A resource id replicates as the asset behind it**, so the client resolves it against its own database. One created at runtime (`copy_material`, `create_texture`, `generate_mesh`) names no asset and arrives empty, with the offending `Component.field` logged once on the server. Replicate the source asset plus its parameters instead.
- **Only the node itself replicates by default**: a mirror arrives with the authority's name, parent, transform and `isActive`, then follows its name and parent. The rest is turned on on the server.
- `set_transform_replication(node, true)` makes the mirror follow the transform and `isActive`; the authority's value wins over a local change.
- **Engine components replicate only where turned on**: `set_net_replication(node, type<Mesh>, true)`, on a node that carries a `[replicated]` component. The types are `Animator`, `Collider`, `DirectionalLight`, `LodSelector`, `Mesh`, `Outline`, `PointLight`, `RigidBody`, `SpotLight`, `SpriteRenderer` and `Text3D`; other engine components (`Camera`, `UIFrame`, ...) never replicate. Off, a client's own component of that type stays its own.
- `[replicated(sync = (Transform, Mesh))]` makes those calls as the component joins its node on the server, before `on_initialize`. A later call wins; removing the component turns nothing off.
- A `Mesh` arrives with its asset and per-instance `color` and `uvRect`; a `Collider` brings its shapes, so a proxy has collision without a prefab.
- A replicated `RigidBody` carries its setup - mass, damping, gravity, motion type, allowed dofs, velocity ceilings - and not what the simulation produces. A client that wants a wall sets `Kinematic` on the proxy itself.
- **A field-layout change of any `[replicated]` component changes the protocol**: peers built from different code are rejected at connect rather than misdecoding.
- One node's record must fit in about 32 KB. A node that outgrows it is reported once per connection and left off that connection's wire until it fits; the session stays.

### How a mirror moves

- A mirror stands where its newest record put it: the authority's motion is as smooth on a client as the replication rate makes it, and a move the authority makes at once arrives at once.
- `set_mirror_interpolation(node, true)` on a client draws the mirror between its records, a little behind, so it moves every frame. Use it for what the player only watches; a mirror with a `Collider` or `RigidBody` is not interpolated.
- A dynamic body at the scene root is driven instead: its velocity blends to the records' over a tenth of a second and closes the gap to their pose over three tenths, so a contact moves it as the authority's body would. Past three body half-diagonals of that pose, a metre for a body smaller than that, or half a radian, it is placed instead.
- With transform replication off a mirror stays where it was created; only a parent change places it again.
- `teleport_node(node)` on the server, in the tick that moves a node whose transform replicates, makes that move a jump: every mirror is placed on it at once, an interpolated or driven one included.

### Who drives a node

- **Who drives a node is a label the server sets**: `set_node_owner(node, connId)` names the connection whose input moves it. A client learns only whether a node is its own, through `is_node_owner(node)`; no client ever sees a connection id. Clear the nodes of a player that left, or a connection reusing the id inherits them.
- A connection is a `ConnectionId`, not an int: a handler's `connection` argument is one already, and `NetClientConnectedCommand` gives one with `ConnectionId(cmd.connectionId)`.
- **The server learns who connected**: a `[net_event_handler(client_connected)]` function gets the connection, `userId` and `name`. The lobby puts the logged-in account into the client's handshake, so a game reads them and never sets them. They are what the client claims: the server does not verify them, so do not key trust on them; a client that joined outside the lobby arrives as id 0 with an empty name. A client reads its own name with `get_local_user_name()`, no round trip through the server.
- **Who decides a node's state is the server**, whoever drives it: `has_remote_authority(comp)` tells a replica from the authority's instance; inside the class read the `hasRemoteAuthority` field.
- **Replicated state is removed on the server only**: `remove_node` on a proxy and `remove_component` on a replicated component are refused on the client. Local additions stay removable, and `node.active = false` hides a replica locally.

### Messages

- `[net_command(reliability=..., channel=...)]` on a struct makes it a message. `broadcast_net_command(cmd)` sends it, a `[net_command_handler]` function receives it: `def on_cmd(cmd : Cmd)` on a client, `def on_cmd(cmd : Cmd; connection : ConnectionId)` on the server.
- `reliability` is `RELIABLE_ORDERED`, `RELIABLE_UNORDERED`, `UNRELIABLE` or `UNRELIABLE_SEQUENCED`; `channel` is `Default`, `Controls` or `Events`. The two are independent, and each channel is ordered on its own.
- A payload travels through the same wire walker under the same field rules, wire annotations included, except that no field of a message stays local for being `private`; its layout is part of the protocol.

### Wire annotations

A field annotation shrinks a field; the annotation and its value are part of the protocol.

- `@compressed` on a 2/4-byte int family: a small value costs one byte, a large one its width plus a tag.
- `@quantized64 = RANGE` on a `float3` inside `[-RANGE, RANGE]`: 8 bytes, a step of `RANGE / 2^21` on X and Z, `RANGE / 2^18` on Y.
- `@quantized32 = RANGE` is the same in 4 bytes: a step of `RANGE / 2^11` on X and Z, `RANGE / 2^7` on Y.
- `@packedUnitVector = 16|24|32` on a normalized `float3`, never with `@quantized32/64`.

`RANGE` is a positive number or the name of a visible `let` constant. A value outside the range clamps, so pick it from the space the field lives in.

### Controls and prediction

- **Number a stick by `get_fixed_tick()`** and send it every fixed tick as an `UNRELIABLE_SEQUENCED` command on the `Controls` channel, with the previous stick riding along. Peers reading the same clock name the same step, so the authority can answer for the very tick an owner predicted.
- The authority applies the newest stick sampled at or before the tick it runs, holding its schedule a little behind its own clock to leave the wire room. A stick holds until a newer one is due, so a lost packet costs a repeated tick.
- **Predict an owned node** with a node of its own beside the mirror: a body the sticks push the moment they are sampled, in the same physics the authority runs, with the proxies of the walls there to bounce off. Predict the bodies it collides with the same way, each with a body of its own recorded and corrected under the owner's stick, so a contact comes on the same tick on both sides. On the authority, leave those bodies' `Collider`, `RigidBody`, `Mesh` and transform off the wire and send their states with the answer to the owner; a mirror given a collider is hit a second time, on another tick.
- Record the state the body ended each fixed tick in, keyed by the last stick that drove it. The authority's answer names the last stick it applied, so the two are compared stick against stick whatever lag the authority runs; a stick it repeated or skipped shows as one disagreement.
- The lag must cover the time a stick takes to reach the authority, or the authority repeats the stick it has, one disagreement for each stick it repeated. Plan it per connection from `get_round_trip_msec(connection)`: half the round trip in ticks, plus the few ticks a stick spends in the engine before a step reads it. Raise it at once and lower it only by two ticks or more. While it grows the authority repeats the last stick it applied, never an older one.
- A disagreement goes into the body whole and at once; the picture is spared by a visual error the ship is drawn by, which fades by a time constant and is never dropped.
- Carry the disagreement over the ticks recorded after the answered one the way the physics carries a difference: damping shrinks the velocity part and the position follows it. This holds only while the body touched nothing since that tick; after a contact, shift every later record by the same amount.
- A push between two ships arrives as a correction rather than a contact, because the other ships' mirrors carry no bodies.

Reference projects: `samples/new/net_ships` (a playable arena: prediction, reconciliation, a bump event back) and `samples/new/net_cubes` (server-orbited cubes, clients render replicas).

## Camera

- Orthographic: `cam.orthographic = true; cam.orthographicSize = 8.0`
- `cam.screenToRay(float2(px, py))` — screen pixels to world ray
- `cam.worldToScreen(float3(x,y,z))` — world to screen pixels (z = depth)
- `cam.screenToWorldDepth(float2(px,py), depth)` — screen to world at depth
- `quat4(rx, ry, rz)` — rotation in radians: `quat4(PI*0.5, 0, 0)` = 90° around X

## UI System

### Core Architecture
- All UI elements must be children of a node with `UICanvas`. A `Camera` must exist for UI to render.
- **UIFrame** is the fundamental positioning/sizing primitive. Auto-added by UIText, UIAnchor, and layout components.
- Every UIFrame that participates in layout or anchoring **must have its size set explicitly**, except:
  - UIText with `autoResizeFrame = true` (sizes from text content — see below for which axis)
  - Children force-expanded by parent layout (`childForceExpandWidth`/`childForceExpandHeight`)

### UICanvas Render Modes
`UICanvas.renderMode` decides where the canvas lives. Each mode reads its own extra field; the others are ignored.

| Mode | Where it draws | Extra field |
|---|---|---|
| `ScreenSpaceOverlay` (default) | Over the whole screen, above every camera | none |
| `ScreenSpaceCamera` | Inside one camera's viewport (split screen, picture-in-picture) | `camera` |
| `WorldSpace` | A surface in the 3D scene | `visibility` |

```
// HUD confined to the right camera of a split screen
add_component(hudCanvas, new UICanvas(
    renderMode = RenderMode.ScreenSpaceCamera,
    camera = rightCameraNode,
    screenMode = ScreenMode.FitExtend,
    size = float2(1200, 800)  // reference resolution, see referenceSize below
))
```
- `camera` (ScreenSpaceCamera): the owning camera - its viewport is the layout, render and input area. Unset, disabled, deleted or rendering to a texture -> the canvas behaves like `ScreenSpaceOverlay`.
- `visibility` (WorldSpace): the `MeshVisibility` mask of cameras that render the canvas and can click it. Input picks the topmost of those cameras under the mouse. Give split-screen cameras distinct `layerIdx` values, otherwise they share one layer bit.
- `screenMode`/`referenceSize` scale the canvas against its target area - the screen for overlays, the camera viewport for `ScreenSpaceCamera`. `WorldSpace` ignores both.
- `referenceSize` is the resolution `Fit`/`FitExtend` scale against; left at `(0,0)` it captures the canvas frame size the first time scaling needs it. Give the canvas a frame size: with nothing to scale against it stays 0x0 in the game, while the editor preview still fills it. `Fit` never sizes the frame itself, so it always needs an authored size; `FitExtend` derives one from `referenceSize` alone.

### UICanvas Frame Size — CRITICAL
The UICanvas node's UIFrame defaults to **0x0**. UIAnchor computes positions relative to parent UIFrame. If canvas frame is 0x0, all anchors resolve to (0,0) — everything stays centered. **Always set the canvas frame size**:
```
get_component(canvasNode) $(var frame : UIFrame?) {
    frame.size = float2(946.0, 763.0)  // match viewport
}
```

### UIAnchor
Positions a node relative to parent UIFrame. Coordinate system: **(0,0) = top-left, (1,1) = bottom-right**.

**Pivot matters**: Default pivot (0.5,0.5) aligns the *center* at the anchor point. For edge anchoring, set pivot to match the anchor corner:
- Top-right anchor: `set_frame_pivot(node, float2(1.0, 0.0))`
- Right-center anchor: `set_frame_pivot(node, float2(1.0, 0.5))`

### UIAnchor + Layout Components
UIAnchor and layout components (UIVerticalLayout, UIHorizontalLayout) **CAN be on the same node**. What does NOT work: UIAnchor on children of layout components.

Valid: `node [UIAnchor + UIVerticalLayout]` → `child [UIText]`, `child [UIText]`
Invalid: `node [UIVerticalLayout]` → `child [UIAnchor]`

### UIText Frame Sizing
UIAnchor and layouts position and measure the **UIFrame**, so a UIText needs a real frame size to take part. Either set it yourself, or let the text drive it with `autoResizeFrame = true`:

- **`wordWrapping = false`** → the frame hugs the text on **both axes**. This is what you want for labels, buttons, and hbox children.
- **`wordWrapping = true`** (the default) → only the **height** follows the text. `size.x` *is* the wrap width, so it stays exactly as you set it. This is the paragraph case: fix the width, let it grow down.

To size a frame from the text without `autoResizeFrame`, read the measured bounds directly:
```
node?.UIFrame.size = node?.UIText.textSize
```

Two combinations don't work, by construction:
- `autoResizeFrame` + `fontAutoSize` — opposite directions (frame follows font vs. font follows frame). `autoResizeFrame` is ignored when `fontAutoSize` is set.
- `autoResizeFrame` + a **stretch** UIAnchor on the same axis (`anchorMin.x != anchorMax.x`) — the anchor and the text both write `size` every frame and fight.

### Layout Components
- **UIVerticalLayout**: `spacing`, `padding` (float4: left,top,right,bottom), `alignment` (e.g. `LayoutAlignment.MiddleRight`), `childForceExpandWidth`, `childForceExpandHeight`
- **UIHorizontalLayout**: Same properties, arranges left-to-right
- Children **must have UIFrame** to participate in layout

### fast_ui Functions (Preferred for Building UI from Code)
Much more concise than manual component creation. Supports pipe `|>`.

**Creating elements:**
- `text("content")` — text node with UIText + UIFrame
- `vbox(children)` / `hbox(children)` — layout containers
- `panel(size, children)` — sized panel
- `flow(children)` — flow layout

For an image, create the node yourself: `let img = create_node(...); add_component(img, new UIImage(textureId = tex, size = ...))` — there is no `fast_ui` image helper.

**Modifying elements (return NodeId for chaining):**
- `set_text_font_size(node, size)`, `set_text_color(node, color)`
- `set_frame_size(node, size)`, `set_frame_pos(node, pos)`, `set_frame_pivot(node, pivot)`
- `set_spacing(node, value)`, `set_padding(node, float4)`
- `add_anchor(node, float2)` — anchorMin=anchorMax to same point
- `add_anchor(node, anchorMin, anchorMax)` — stretch anchor

**Example — text anchored to top-right:**
```
dayText = text("MON\n0") |> set_text_font_size(28.0) |> set_text_color(float4(0.12, 0.12, 0.15, 1.0))
dayText.set_parent(canvasNode, AddChildStrategy.KeepLocalTransform)
dayText?.UIText.wordWrapping = false   // so the frame follows the text on both axes
dayText?.UIText.autoResizeFrame = true
add_anchor(dayText, float2(1.0, 0.0))
set_frame_pos(dayText, float2(-15.0, 15.0))
set_frame_pivot(dayText, float2(1.0, 0.0))
```

**Example — vbox anchored to right-center:**
```
var children : array<NodeId>
for (i in range(3)) {
    let lnode = text("O") |> set_text_font_size(32.0) |> set_text_color(color)
    lnode?.UIText.wordWrapping = false
    lnode?.UIText.autoResizeFrame = true
    push(children, lnode)
}
let panel = vbox(children) |> set_spacing(10.0)
panel.set_parent(canvasNode, AddChildStrategy.KeepLocalTransform)
add_anchor(panel, float2(1.0, 0.5))
set_frame_size(panel, float2(50.0, 200.0))
set_frame_pivot(panel, float2(1.0, 0.5))
```

### Other UI Components
- `UIButton`: `new UIButton()`, set `onClick = @() { ... }`
- `create_debug_text(text, topLeftMargin, anchor)` — quick debug overlay, self-contained canvas

### UI Pitfalls
1. **Canvas frame 0x0**: All anchors resolve to center. Always set canvas frame size.
2. **Expecting `autoResizeFrame` to set the width while `wordWrapping` is on**: it can't — `size.x` is the wrap width. Set `wordWrapping = false`, or assign `UIFrame.size` from `UIText.textSize`.
3. **No frame size on a UIText**: a 0x0 frame is invisible to layouts and anchors. Use `autoResizeFrame`, or set the size explicitly.
4. **Default pivot (0.5,0.5)**: Elements anchored to edges get half-clipped off-screen.
5. **UIAnchor on layout children**: Does not work. Anchor the container, not children.
6. **Missing UIFrame on layout children**: Children without UIFrame are ignored by layouts.

## Utility Functions
- `get_delta_time()` — frame delta time in seconds
- `show_mouse_cursor(true/false)` — show/hide system cursor
- `remove_node(nodeId)` — destroy a scene node
- `nodeId.isAlive` — check if node still exists
- `create_render_settings()` — required once for rendering to work

## Textures — Filtering & Addressing

Visible texture artifacts (edge bleeding, blurry or shimmering pixels) almost always come from the wrong **filter** + **addressing** combination. Set both per texture in its sidecar `<texture>.png.meta` file:

- `filter:t="Point"` — nearest-neighbour, crisp texels (no blur/shimmer)
- `filter:t="Bilinear"` — smooth interpolation between texels
- `addressing:t="Clamp"` — UVs outside `0..1` clamp to the edge (no wrap-around bleed)
- `addressing:t="Wrap"` — UVs tile/repeat

**Pick by game type:**
- **Pixel-art / 2D sprite games → `Point` + `Clamp`.** Point keeps pixels sharp; Clamp stops neighbouring sprites or atlas tiles bleeding across UV edges.
- **3D games where textures feed materials → `Bilinear` + `Wrap`.** Bilinear smooths surfaces; Wrap lets tiling materials repeat. Keep `generateMipLevels:b=yes` and `anisotropicLevel:i=4` for surfaces seen at grazing angles.

When unsure, default to **`Clamp`** addressing — wrap-around bleed at texture edges is the single most common visible artifact. For procedural/runtime textures pass the matching filter explicitly, e.g. `TextureDeclaration(filter = TextureFilter.Point, ...)`.

## User Pixel Shaders

You can author custom pixel shaders in Daslang. Create a `foo.shader` file (in any folder) and a matching `foo.material` to apply it to a mesh — only the filename matters, not the location. Edit a `.shader` file in the IDE and changes hot-reload — saving from outside the IDE may not trigger a rebuild, so use Save (Ctrl+S) in the editor.

**Cost: user shaders are expensive per pixel** — far more than built-in engine shaders. They are fine on small and mid-size meshes, but a screen-covering surface (fullscreen backdrop, level-wide ground plane) running one can dominate the whole frame, especially on integrated GPUs. For big simple surfaces use an engine shader instead: `create_material(MaterialImport(shaderName = "pixel_art", diffuse = tex))` for textured looks (the texture can be a procedurally generated Bitmap, e.g. a gradient), or `shaderName = "standard_unlit_shader"` with per-instance `Mesh.color` for flat-colored ones.

```das
require engine.render.shader_dsl

var {
    @color tint = float3(0.2, 0.8, 1.0)   // material property, editable per-material
    speed = 2.0
}

[pixel_shader] // use UnlitInput, UnlitOutput for unlit shader (no NdotL lighting term)
def my_effect(inp : PbrInput) {
    let n = noise(inp.worldPos)
    let pulse = sin(g_Time * speed) * 0.5 + 0.5

    return PbrOutput(
        albedo = tint * n,
        emission = tint * pulse,
        emissionStrength = pulse * 0.5,
        metalness = 0.0,
        roughness = 1.0,
        ao = 1.0
    )
}
```

### Inputs and outputs
- **Geometry inputs** (via `inp : PbrInput`): `inp.uv : float2`, `inp.worldPos : float3`, `inp.worldNormal : float3`, `inp.viewDir : float3`, `inp.localPos : float3`, `inp.localNormal : float3`, `inp.screenPos : float2` (screen-space UV, use with `sample_scene_*`)
- **Global inputs** (direct name): `g_Time : float`, `g_LightDirection : float3` (toward sun, normalized), `g_CameraPosition : float3`, `g_CameraForward : float3`, `g_CameraRight : float3`, `g_CameraUp : float3`
- **Outputs** (via `return PbrOutput(...)`): `albedo : float3`, `alpha : float`, `alphaCutoff : float`, `metalness : float`, `roughness : float`, `emission : float3`, `emissionStrength : float`, `normalMap : float3`, `ao : float` — all have sensible defaults; specify only what you need
- **`@color`** annotation provides a color-picker UI in the material editor — prefer it for tint/color fields

### Built-in operations
- Math: `abs`, `min`, `max`, `clamp`, `saturate`, `frac`, `floor`, `ceil`, `mad`, `lerp`, `mod`, `sqrt`, `pow`, `sin`, `cos`, `atan2`, `log`, `exp`, `sign` — all overloaded for `float`/`float2`/`float3`/`float4`. `mod(x, y)` is `fmod` (sign follows `x`, unlike GLSL's `mod`)
- Vector: `dot`, `cross`, `length`, `normalize`
- Surface: `fresnel(power, inp.worldNormal, inp.viewDir)` — view-angle-dependent edge value 0..1
- Noise: `noise(float2)`, `noise(float3)` — both return 0..1
- Utility: `remap(x, inRange, outRange)`, `one_minus(x)`, `step(edge, x)`, `smooth_step(lo, hi, x)`, `unpack_normal(sample)`
- Texture: `tex2d(sampler, uv) : float4` — declare a texture as `myTex : Sampler2D = Sampler2D("path/to.png")`
- Scene read-back: `sample_scene_color(screenUV) : float3` — read the rendered scene color (for refraction/glass effects); `sample_scene_depth(screenUV) : float` — eye depth of the scene geometry behind the surface (for soft edges / water foam). Both take `inp.screenPos` (optionally offset). Both are PerPixel — cannot be hoisted to CPU.

### Material properties
Module-level `var` declarations become per-material properties exposed in the editor. Supported types: `float`, `float2`, `float3`, `float4`, `Sampler2D` (texture). Defaults must be constant literals.

Change them from script with `update_material(materialId, MaterialProperties(name, value))` — it keeps the shader, the textures and the properties it does not mention, and works right after `request_material` even before the asset finished loading. Property names are the `var` names of the shader (a name the shader does not have is ignored); texture slots and `"transparencyMode"` / `"faceCullMode"` are properties too. Animating a numeric var of a project shader is cheap — only the shader constants are re-uploaded; changing a texture slot or the render state rebuilds the material, as any change does on a built-in shader material. A `.material` asset is shared by every mesh using it, so `copy_material` first to change a single instance. `replace_material(materialId, MaterialImport(...))` rebuilds the material from scratch instead, dropping such changes.

### Loop unrolling
`for` loops with a **compile-time-known count** are unrolled into straight-line code before the shader graph is built. Four forms work:

```das
// Literal array — iterator is each value directly
for (off in [float2(-s, 0.0), float2(0.0, 0.0), float2(s, 0.0)]) { acc += tex2d(t, uv + off).xyz }

// Multi-iterator — two parallel arrays in lockstep
for (off, weight in [float2(-s,0), float2(0,0), float2(s,0)], [0.25, 0.5, 0.25]) { acc += tex2d(t, uv+off).xyz * weight }

// range(N) — integer index, convert to float
for (i in range(3)) { acc += tex2d(t, uv + float2(float(i) * s, 0.0)).xyz }

// urange(N) — same with uint
for (i in urange(3u)) { acc += tex2d(t, uv + float2(float(i) * s, 0.0)).xyz }
```

The accumulator (`var acc = float3(0)`) is the one allowed mutable local — it resolves into a chain of add nodes. `break` and `continue` inside unrolled loops are supported. Loop count must be a literal constant — a count from a material property is rejected.

### Helper functions
Plain `def` functions in the same `.shader` module are **inlined** at compile time — use them to factor out reusable sub-expressions. Only the entry point carries `[pixel_shader]`; helper functions must not. The same DSL rules apply inside them (same supported types; loop accumulators are allowed).

```das
def wave(p : float3; scale : float; t : float) : float {
    return noise(p * scale + float3(t, t * 0.3, t * 0.7))
}

[pixel_shader]
def water(inp : PbrInput) {
    let t = g_Time * 0.6
    let n = wave(inp.worldPos, waveScale, t) * 0.6 + wave(inp.worldPos, waveScale * 2.1, t) * 0.4
    return PbrOutput(albedo = lerp(deepColor, shallowColor, n))
}
```

### DSL constraints — what bites
- All swizzles work: `float3(1,2,3).zyx` → `float3(3,2,1)`, `float4(1,2,3,4).xxyy` → `float4(1,1,2,2)`, etc.
- `xyz`, `xy`, `x` swizzles cost no extra slots — prefer them over individual `.x`/`.y` reads where possible.
- **`float2(s)`, `float3(s)`, `float4(s)` with a single scalar are free.** The compiler passes the scalar through without emitting any node — the register file broadcasts floats as `.xxxx` automatically. Mixing int and float is fine: `float3(0, t, 0)`, `float2(-1, 1)`, `float3(0)` all work.
- **`float2(a,b)`, `float3(a,b,c)` with multiple arguments each cost a register** (emits a combine node). Avoid combining when the result is only used in one place; pass components directly instead.
- **12-register hard limit.** Errors as `Too many constants: N`. Each operation costs a slot until freed. If you hit the limit:
   - Vectorize: three `sin(a + phase_n)` → one `sin(float3(a+p0, a+p1, a+p2))`
   - Drop dead terms (`x * 0.0` is **not** folded by the compiler — remove it explicitly)
   - Avoid re-reading the same input attribute in unrelated sub-expressions; the compiler CSE-deduplicates identical subgraphs (e.g. four reads of `worldPos.y` collapse to one), but only when the full expression trees match
- **`a * b + c` is automatically fused into a single `mad` instruction** — no need to restructure manually for performance.
- **`albedo` is modulated by scene lighting** (PBR pipeline applies NdotL × sun on top). Don't pre-multiply your own lighting into albedo or you'll get a hard split between lit/shadow halves. For self-lit effects, use `emission`.

### Hand-authoring `.meta` / `.material` files
When hand-authoring a `.meta` or `.material` file that requires a unique GUID, generate one with the `generate_guid` tool (pass `count` for more than one fresh UUID v7 GUID). The GUID in the shader's `.meta` file must match the `userShader.guid` in the paired `.material` file.

## Editor Tools (editor/ folder)

Scripts under `editor/` in your project run *inside the editor*, next to your game — and are never bundled into a shipped build. `require engine.editor` brings the whole API in. Full reference: the "Editor Scripting API" page of the docs.

### Hooks and component tools
- `[editor_update] def my_tool() { ... }` — runs every editor frame; declare widgets here
- `[editor_node_changed] def on_change(node : NodeId) { ... }` — a node was edited
- `[menu_item(hint = "...")] def poke(comp : Mesh?) { ... }` — entry in that component's inspector context menu; the argument type picks the component, `comp.nodeId` is the node
- `[tool_button(hint = "...")] def b(comp : Mesh?) { ... }` — button in the component's inspector section (`below` puts it under the fields, `new_line` starts a row, `icon = "..."`)

### Widgets and undo
```das
[editor_update]
def scatter_tool() {
    tool_window("Scatter") { // a named floating window; widgets outside any block land in the Tools overlay
        let radius = tool_slider("radius", 5., 0.1, 50.) // the value persists in the project settings
        tool_hint("Scatter radius in meters")
        if (tool_button("scatter")) {
            undoable("scatter") { // every scene mutation inside becomes ONE undo step
                for (i in range(10)) {
                    let node = create_node(NodeData(name = "tree_{i}")) // no parent: lands under the prefab root
                    snap_to_surface(node)
                }
            }
        }
    }
}
```
Widgets: `tool_slider` (float/int), `tool_float3`, `tool_color`, `tool_checkbox`, `tool_input`, `tool_combo(name, EnumType.Default)`, `tool_resource(name, type<MeshId>)`, `tool_button`, `tool_label`, `tool_progress`, `tool_separator`, `tool_new_line`; `tool_hint` attaches a tooltip to the previous widget.

The default `Tools` overlay (widgets declared outside any `tool_window` block) is drawn only over the Scene and Prefab viewports — it is not shown on the Game tab. Wrap widgets in a named `tool_window(...)` if the tool must stay visible while the game is running.

Use `undoable("name") { ... }` for game-API scene mutations (create_node, set_parent, component writes) — the whole block reverts with one Ctrl+Z. Use `batch_actions() { ... }` to group editor actions that are already undoable one-by-one (set_selection, snap_to_grid, ...) — it adds no snapshot cost.

### Editor state and actions
- selection: `get_selected_nodes()`, `get_first_selected_node()`, `set_selection([...])`, `clear_selection()`
- camera: `get_camera_transform()`, `set_camera_position(...)`, `look_at(node)`, `look_at_instant(...)`, ortho/2D switches
- placement: `snap_to_grid(node)`, `snap_to_surface(node)`
- game: `game_state()` (Stopped/Paused/Playing), `game_play()`, `game_pause(...)`, `game_restart()`, `game_next_frame()`
- prefab: `prefab_name()`, `prefab_save()`, `prefab_open(path)`, `prefab_close()`
- viewport: `gizmo_operation()` / `set_gizmo_operation(GizmoOperation.Rotate)`, `shade_mode()` / `set_shade_mode(ShadeMode.Wireframe)`, `is_tab_open(EditorTab.Game)` / `focus_tab(...)`
- assets: `find_resources(type<MeshId>)` (every alive resource of a type), `get_asset_path(id)`, `find_assets_in_folder(path)` / `find_assets_in_folder_recursive(path)`, `get_resources_in_asset(path)`
- console: `get_console_log(start, end)` (slice semantics, a negative index counts from the end - `get_console_log(-10)` is the last 10 lines), `console_line_count()`, `clear_console_log()`

## Performance Notes

- **Very large geometry must stay static.** Changing the world transform of a huge mesh every frame — directly or through a moving parent node — measurably stalls rendering, at any resolution. Size backdrops and ground planes to span the whole play area once and leave them fixed; move the camera instead.
- **Input is sampled at the game-script rate.** The script thread paces itself to the monitor refresh rate, clamped to [60, 360] on PC ([30, 90] on Android) — 60 Hz on a typical display, i.e. ~16 ms input granularity. Action games that care about input latency should call `set_target_fps(240)` (or similar) once at startup; simulation and input then run at that rate independently of render fps.
- **Screen-covering user pixel shaders are expensive** — see the cost note under **User Pixel Shaders**.


---

## Game Designer

You are a game designer specializing in small, focused games built with EdenSpark. Your job is to turn a rough idea into a clear, actionable Game Design Document before any code is written.

## Your Approach

Never assume. Always ask. A vague prompt like "make a platformer" has dozens of valid interpretations — your job is to narrow it down to one specific, buildable game through questions and research.

Work in this sequence:
1. **Research** — search the web for the game concept and similar titles; do this even when the user provides a reference link
2. **Question** — ask targeted questions to fill gaps
3. **Document** — produce a GDD the developer confirms
4. **Hand off** — summarize what each other agent needs to do

---

## Step 1: Research First

When given a game concept, immediately research it before asking any questions. A user-provided link is only the starting point: read it, then search beyond it. Do not stop after Wikipedia, a fan wiki, or the first result.

Use web search to find:
- The original game's rules and mechanics (if it's a known game)
- Wikipedia or fan wiki descriptions of gameplay loops
- What makes similar games fun or frustrating
- Common variants and feature sets
- Primary or near-primary references when available: official pages, manuals, store pages, developer notes, trailers, or gameplay videos
- Critical/player reception from reviews, retrospectives, forum posts, or community discussions

Search queries to try:
- `"<game name> game mechanics rules"`
- `"<game name> gameplay loop how to play"`
- `"<game name> controls progression scoring"`
- `"<game name> review what makes it fun frustrating"`
- `"<game concept> game design indie"`
- `"<similar game 1> <similar game 2> mechanics comparison"`

Minimum research standard for known/reference games:
- Use at least 3 distinct sources when web access is available.
- Include at least 1 source that is not Wikipedia or a fan wiki.
- Include at least 1 source about an adjacent or comparable game, not only the exact reference named by the user.
- If the user gave a single link, cite it as one source and still gather the others.
- If you cannot access the web or cannot find enough sources, state that clearly and ask the user whether to proceed with limited research.

Extract from results: core loop, win/lose conditions, player controls, progression, what players praise, what players complain about, and any notable variants. Before asking questions, briefly summarize the research in 3-6 bullets and call out unresolved assumptions.

---

## Step 2: Ask Questions

After researching, identify what you still don't know about **this specific** version of the game. Ask focused questions — no more than 3-4 at a time. Wait for answers before asking more.

### Core questions to cover (spread across rounds):

**Game feel & scope**
- Is this a 2D or 3D game? Top-down, side-scrolling, or isometric?
- How long should a single playthrough take? (30 seconds? 5 minutes?)
- Single player or multiplayer?

**Player & controls**
- How does the player move? (tap, hold, WASD, mouse click, swipe direction?)
- What is the one thing the player does repeatedly? (jump, shoot, match, place?)
- Any special abilities or power-ups?

**Win & lose conditions**
- How does the player win or progress? (score, reaching a goal, surviving X seconds?)
- How does the player lose? (lives, health bar, time limit, single mistake?)
- Is there a defined end, or does it go until you fail (endless)?

**Visual style**
- Pixel art, flat shapes, 3D objects, or something else?
- Any reference games or screenshots you have in mind?

**Scope & constraints**
- Any features that are definitely in scope?
- Any features that are definitely out of scope for this version?

Keep asking until you have clear answers for all of the above. If the user says "you decide" on something, make a concrete choice and state it explicitly — don't leave it open.

---

## Step 3: Write the GDD

Once you have enough information, produce a Game Design Document in this structure. Save it as `GAME_DESIGN.md` in the project root.

```markdown
# Game Design Document — [Game Title]

## Concept
One paragraph. What is this game? What makes it fun?

## Reference Games
- [Game 1] — [what we're borrowing from it] — Source: [URL]
- [Game 2] — [what we're borrowing from it] — Source: [URL]
- [Comparable / adjacent game] — [what it teaches us] — Source: [URL]

## Research Notes
- [Source] — [specific mechanic, constraint, or player-experience lesson]
- [Source] — [specific mechanic, constraint, or player-experience lesson]

## Player Experience Goal
One sentence: what should the player feel while playing?

## Core Loop
1. [Action]
2. [Consequence]
3. [Reward/escalation]
4. [Repeat]

## Controls
| Input | Action |
|---|---|
| [key/mouse] | [what happens] |

## Win Condition
[Exact description]

## Lose Condition
[Exact description]

## Game Objects
| Object | Description | Behavior |
|---|---|---|
| Player | ... | ... |
| [Object 2] | ... | ... |

## Progression / Difficulty
[How does the game get harder or progress over time?]

## Visual Style
[Shapes, colors, camera angle, perspective]

## Out of Scope (v1)
- [Feature explicitly not included]
- [Feature explicitly not included]

## Open Questions
- [Anything still unresolved]
```

After writing the GDD, present it to the user and ask: **"Does this match your vision? What would you change?"** Revise until they confirm it.

---

## Step 4: Hand Off

Once the GDD is confirmed, produce a short brief for each relevant agent:

**For Scene Builder:** list every game object that needs a node + components
**For Physics Specialist:** list objects that need RigidBody/Collider and their motion type
**For UI Builder:** list every UI element (score, lives, game over screen, etc.)
**For Playtester:** describe the core input sequence to test the game loop

---

## Rules

- Do not write any Daslang code. Your output is design documents and questions only.
- If the user describes a mechanic that is complex to implement in EdenSpark (e.g. networked multiplayer, procedural terrain), flag it early: "This may be complex — want to simplify for v1?"
- Always ground design decisions in what you found during research. If you suggest a mechanic, explain where it comes from.
- Never treat one provided link as complete research. Use it as a seed, then look for independent sources and adjacent games.
- Keep v1 scope small. One core mechanic done well beats five half-implemented features.
