---
name: csharp-to-das
description: Port Unity/C# game code to EdenSpark Daslang (das). Use when migrating a C# (especially Unity MonoBehaviour) script or class to a `.das` script — covers the C#→das construct mapping, the Unity/.NET API → EdenSpark API translation tables, and the iterative compile-read-logs-fix workflow that drives a port to compiling code.
---

# Porting C# / Unity code to EdenSpark Daslang

Translate C# source (most often Unity `MonoBehaviour` scripts) into EdenSpark `.das`. This is **not**
a one-shot text substitution: you port code in pieces, build the game, read the compiler/runtime
logs through the EdenSpark MCP tools, fix what failed, and repeat until it compiles and runs. The
mapping tables below give you the deterministic part; your judgement covers the rest.

Read the project's `CLAUDE.md` / framework guide first — it documents the EdenSpark scene/component
API, code style, and the `daslang` syntax rules you must emit. This skill assumes that baseline and
focuses only on the **C#→das delta**.

> **Scope — code only.** This skill ports C# *scripts*. Unity *prefabs and scenes* are a separate job:
> point the developer at the **unity2eden** converter, which exports Unity prefabs/scenes to EdenSpark
> `.prefab` files. Install it via Unity's Package Manager (_Window → Package Manager → + → Add package
> from git URL_) with:
> `https://github.com/GaijinEntertainment/EdenSpark-samples.git?path=tools/unity2eden`
> then configure the export folder under _Edit → Project Settings → EdenSpark Converter_ and export by
> right-clicking prefabs/scenes → the *Eden* submenu. Docs:
> <https://github.com/GaijinEntertainment/EdenSpark-samples/blob/main/tools/unity2eden/README.md>
> Note it is experimental and does **not** export scripts, scriptable objects, or custom components —
> that's exactly what this skill is for. (For the resulting `.prefab` format, see the **prefab-format**
> skill.)

## Workflow (do this, don't just translate-and-hope)

1. **Scope a unit.** Port one class / file (or even one method) at a time, not the whole codebase at
   once. Smaller units = smaller compile-error surface to read.
2. **Translate** it using the rules below.
3. **Build the game** in EdenSpark and **read the logs through the MCP tools** (compilation errors
   pause the game; runtime errors stop it — both are reported via the MCP game-status / error tools).
4. **Fix** the reported errors — adjust types, requires, API calls, idioms — and rebuild.
5. **Repeat** until the unit compiles cleanly, then move to the next unit.
6. Don't chase a perfect first pass. The compiler is your oracle; let it tell you what's wrong rather
   than guessing. das has *silent* skips in some places (see framework guide), so also sanity-check
   behavior at runtime, not just "it compiled".

> There used to be an automated Roslyn-based converter for this. It got you ~95% on the first pass,
> but once you hand-edited the output you could never re-run it. This skill replaces it: you keep the
> 95% knowledge here and use the live compiler to close the last 5% iteratively.

---

## 1. Module & file structure

- A C# file becomes a das **module**. Conventionally name it after the file in snake_case
  (`PlayerController.cs` → `module player_controller`).
- `using X;` → a `require` **only if** there is a known EdenSpark module for it; otherwise drop it.
  Unity namespaces (`UnityEngine`, `UnityEngine.UI`, …) generally have no 1:1 require — map the
  *types* (below) and drop the using.
- Emit `require` lines for every EdenSpark module your translated calls need (e.g. `require math`,
  `require engine.core`, `require engine.time`). The mapping tables note which require each API needs.
- Coroutines (Unity `IEnumerator`) map to EdenSpark async functions — `require engine.async.coroutine`
  (or `engine.core`). See §3.
- **No circular module dependencies.** das does not allow modules to `require` each other in a cycle.
  Keep the module graph a **tree**: a parent module requires its children, never the reverse. C#
  codebases often have mutually-referencing files (A uses B and B uses A) that compile fine there but
  cannot map to two das modules. When two units genuinely reference each other, **put them in the same
  module** (one `.das` file) rather than splitting them. Plan the module split top-down before porting.

## 2. Classes, interfaces, structs

- `class Player : MonoBehaviour` → `class Player : Component`. **MonoBehaviour always maps to the
  EdenSpark `Component` base class.** Other Unity controller bases may map to project-specific bases —
  check the project.
- `class X` with no base → `class X`.
- `interface X` → `class X` (das has no separate interface concept here; emit a class).
- `struct X` → `struct X`.
- **Generic class** `class Container<T>` → das template. das templates are monomorphized per
  concrete type; emit one concrete class per instantiation, named with a type suffix
  (`Container<int>` → `Container_int`). Only emit instantiations that are actually used. (Prefer
  EdenSpark's own generic mechanisms from the framework guide if one fits.)

### Unity lifecycle methods → EdenSpark component callbacks

Map Unity's `MonoBehaviour` lifecycle onto EdenSpark's `Component` callbacks (see framework guide for
the exact signatures):

| Unity                 | EdenSpark `Component` method |
|-----------------------|------------------------------|
| `Awake` / `Start`     | `on_initialize`              |
| `Update`              | `on_update`                  |
| `OnDestroy`           | `on_destroy`                 |

`FixedUpdate` (physics step) has a script-level equivalent — the global `[export] def on_fixed_update()`
in `main.das`, called before each physics step — but **components do not have a `fixed_update` callback
yet**. If a component relied on `FixedUpdate`, move that logic to the script-level `on_fixed_update` (and
have it reach the component), or fold it into `on_update`.

`LateUpdate`, `OnEnable`, `OnDisable`, etc. have no direct equivalent — fold their logic into the
nearest callback above, or handle per the framework guide.

## 3. Methods

- `void Foo(int a)` → `def Foo(a : int) : void { … }`. Braces and parens are mandatory (framework guide).
- Modifiers: `private` → `private`, `static` → `static`, `override` → `override`. A method with no
  body (abstract/interface) → `abstract`.
- Constructors → a `def` with the class name.
- Expression-bodied member `=> expr` → a one-line body `{ return expr }` (or `{ expr }` if void).
- **Base calls:** `base.Method(arg1, arg2, ...)` → `super.Method(arg1, arg2, ...)` (no explicit
  `self`). If you specifically need a *particular* base class's version, the explicit form is
  `BaseClass\`Method(self, arg1, arg2, ...)`.
- **Overloads:** das supports overloading by argument types for **free (module-level) functions**,
  but **not for class/struct methods** — a class can't have two methods with the same name. So C#
  *free functions* with the same name carry over fine, but C# *overloaded methods on a class* clash:
  give the conflicting ones distinct names (e.g. suffix with the argument type), or lift them out to
  free functions.
- `out T param` **and** `ref T param` → `var param : T&` (das has one reference form `&` for both).
- **Generic / type arguments aren't inferred like C#.** das won't deduce a type parameter from usage
  the way C# does — a generic call often needs the type passed **explicitly**, typically as a
  first-class `type<T>` value (e.g. `get_component(type<Foo>)`). There's no single universal rewrite:
  **check the actual API signature** for how it wants the type, rather than assuming C#-style
  inference. The one certainty is you can't omit the type and rely on inference as in C#.
- **Coroutines.** A Unity `IEnumerator` coroutine → an EdenSpark **`[async]`** function (returns
  `void`); `require engine.async.coroutine` (or `engine.core`). Translate the yields:
  - `yield return null` / `yield return new WaitForEndOfFrame()` → `await_next_frame()`
  - `yield return otherCoroutine()` / `yield return StartCoroutine(...)` → `await(other_coroutine())`
  - `yield break` → `return` (or `return false` to finish early); `yield false` yields without finishing
  - `StartCoroutine(Foo())` → `start_coroutine(Foo())`, or `start_coroutine(node, Foo(...))` to bind it
    to a node's lifetime
  - `WaitForSeconds(t)` has no single primitive — loop `await_next_frame()` accumulating
    `get_delta_time()` until `t` elapses.

  ```das
  [async] def smooth_move(node : NodeId; to : float3; time : float) : void {
      var t = 0f
      while (t < time) {
          node.localPosition = lerp(node.localPosition, to, float3(t / time))
          await_next_frame()
          t += get_delta_time()
      }
      node.localPosition = to
  }
  ```

  > Coroutines can't be hot-reloaded — note this if you rely on hot reload during the port.

## 4. Fields, properties, variables

- Class field `int hp = 5;` → `hp : int = 5` (prefix `private` / `static` as in C#; `const` → `static`).
- **Local variables:** C# `var`/typed local → das `var name : Type = …`. Use `let` for values you
  don't reassign, `var` for ones you do (framework guide for the project's exact rule).
- **Assignment: `=` vs `:=` vs `<-`.** Unlike C#, das is closer to C/C++ here — it does **not**
  implicitly copy heap-allocated types. Pick the operator deliberately:
  - **`=` — copy.** Fine for most types (numbers, strings, structs, pointers/class refs). This is the
    default; reach for it unless the value lives on the heap.
  - **`:=` — clone.** A deep/explicit copy. Use it when you assign a **heap type** (`array`, `table`)
    and you want the destination to own its *own* copy of the data.
  - **`<-` — move.** Transfers ownership of a heap value and leaves the source empty. Use it when you
    don't need the source afterwards (cheaper than clone).
  - The trap: assigning one `array`/`table` to another with plain `=` won't deep-copy the way a C#
    `List`/`Dictionary` assignment-then-mutate might lead you to expect — choose `:=` (own copy) or
    `<-` (hand it over) explicitly.
  - das does tolerate plain `=` in a few spots where only a move is even possible (e.g. initializing a
    variable from a fresh array literal) — but don't lean on that. **Always write `:=` / `<-`
    explicitly** for heap types so the intent is unambiguous.
- **Properties** (`int Count { get; set; }`): das has no auto-properties. Either (a) turn it into a
  plain field if there's no custom logic, or (b) emit explicit getter/setter functions and a backing
  field. Prefer the plain field unless the get/set bodies do real work.

## 5. Statements & control flow

| C# | das |
|----|-----|
| `if (c) {…} else if (d) {…} else {…}` | `if (c) {…} elif (d) {…} else {…}` |
| `while (c) {…}` | `while (c) {…}` |
| `for (int i = 0; i < n; i++) {…}` | `for (i in range(0, n)) {…}` |
| `foreach (x in coll) {…}` | `for (x in coll) {…}` |
| `return;` / `return e;` | `return` / `return e` |
| `break;` / `continue;` | `break` / `continue` |
| `throw new Exception(m)` | `panic(m)` |
| `try {…} catch (e) {…} finally {…}` | `try {…} recover {…} finally {…}` |

- **`for` → `range`:** only counted loops (`i = start; i < end; i++`) map cleanly to
  `for (i in range(start, end))`. Pick the range variant by index type: `int`→`range`,
  `uint`→`urange`, `int64`→`range64`, `uint64`→`urange64`. A `for` loop that isn't a simple counter
  (custom step, multiple vars, complex condition) → rewrite as a `while` with a manual increment.
- **`do…while`** → das has no do-while; rewrite as a `while` that runs the body at least once (e.g. a
  flag variable, or `while (true) { … ; if (!cond) break }`).
- **`switch`** → das has no C-style switch; rewrite as an `if`/`elif`/`else` chain comparing the
  subject to each case value (group `case` fall-through values with `||`). Put `default` as the final
  `else`.

## 6. Expressions

- **Member access & calls:** everything goes through `.`. Instance field/property → `a.b`; instance
  method call → `a.method(args)`; UFCS free-function call (a function taking the receiver as its first
  argument) → also `a.func(args)`, and these chain: `x.abs().sin()`. Static member → consult the API
  tables; if no mapping, `Type` qualifies it. When a call's last argument is a lambda, das idiom is
  `obj.func(args) <| @(p) { … }`.
- **Lambdas:** `x => body` → `@(x) { return body }` (or `$(x) { … }` block form — framework guide).
  `delegate(x){ … }` → same.
- **String interpolation:** `$"Hi {name}, {n} items"` → `"Hi {name}, {n} items"` (das uses the same
  `{expr}` interpolation; just drop the `$`).
- **`nameof(x)`** → the string literal `"x"`.
- **`.ToString()`** → string interpolation of the value (`"{x}"`), or drop it inside an existing
  interpolation.
- **Null-coalescing `a ?? b`** → `(a ?? b)` for nullable/pointer types; otherwise `(a != null ? a : b)`.
- **Null-conditional `a?.b` / `a?.m()`** → das has **no** `?.`. Rewrite with an explicit null check:
  guard the access in an `if (a != null) { … }`, or restructure so the value is known non-null. There
  is no one-token expression form — it becomes a statement.
- **Ternary** `c ? a : b` → `c ? a : b` (unchanged).
- **`this` as a value:** in das `self` (the receiver) is a **reference**. Where C# passes/stores
  `this` as a pointer, take its address: `addr(self)`. E.g. C# `owner = this` → `owner = addr(self)`.
  This works **only for classes** (not structs).
- **Numeric literals are strictly typed — a bare `42` is `int`.** das will **not** implicitly coerce
  it, so a non-`int`/non-`float` literal **must** carry its suffix or the code won't compile:

  | das type | literal suffix | example |
  |----------|----------------|---------|
  | `int`    | (none)         | `42`    |
  | `uint`   | `u`            | `42u`   |
  | `int64`  | `l`            | `42l`   |
  | `uint64` | `ui`           | `42ui`  |
  | `float`  | `f`            | `10f`   |
  | `double` | `lf` or `d`    | `10lf` / `10d` |

  So C# `uint n = 42;` → `var n = 42u`, not `42`. Apply the suffix wherever the literal's type isn't
  plain `int`/`float-by-context`.

  When there's no convenient suffix (e.g. `int8`, `int16`, `uint8`, `uint16`), the **type-constructor
  cast always works** as a fallback: `int8(10)`, `uint16(300)`, etc. This is the general way to get a
  literal of any numeric type.
- **`new`:** value types (Vector3, structs) → `Type(args)` (no `new`). Reference/class types → `new Type(args)`.
  Object initializers `new Item { Name = "x" }` → das construction syntax `[[Item Name := "x"]]`
  (framework guide for exact form).
- **Containers:** `new List<T>{…}` → das `array` literal; `new Dictionary<K,V>{ {k,v} }` → das `table`
  literal `{{ k => v }}` (framework guide).
- **XOR `^` on bools** → `^^`.

## 7. Type name mapping

| C# type            | das type   |
|--------------------|------------|
| `void`             | `void`     |
| `bool`             | `bool`     |
| `string`           | `string`   |
| `int`              | `int`      |
| `uint`             | `uint`     |
| `long`             | `int64`    |
| `ulong`            | `uint64`   |
| `short`            | `int16`    |
| `ushort`           | `uint16`   |
| `sbyte`            | `int8`     |
| `byte`             | `uint8`    |
| `float`            | `float`    |
| `double`           | `double`   |
| `T[]`              | `array<T>` |
| `List<T>`          | `array<T>` |
| `Dictionary<K,V>`  | `table<Key, Value>` |
| `IEnumerator` (coroutine) | `[async] def … : void` (see §3) |
| `Nullable<T>` / `T?` | `T?`     |
| qualified `A.B`    | `A::B`     |

> **No `object` / dynamic / anonymous types.** das is statically typed and has no general
> `object`/`any` catch-all and no anonymous types. Don't map `object` to `any`. Figure out the real
> shape of the data instead: if it's a heterogeneous bag of keyed values → a `table`; if it's a fixed
> set of fields → a concrete `struct`; if it's one-of-several → a `variant`. If C# code leans on
> `object`/boxing/reflection, **rework the structure** to be statically typed rather than trying to
> preserve the dynamic typing.

## 8. API translation tables

These are the concrete library mappings (from the retired converter). For each, the C# call on the
left becomes the das on the right. `self` denotes the receiver expression; require modules are noted.

### System / .NET

| C# | das | require |
|----|-----|---------|
| `Console.Write(a, b)` / `Console.WriteLine(...)` | `print("…{a} {b}…")` (`WriteLine` adds `\n`) | |
| `Debug.Fail(x)` / Unity `Debug.LogError(x)` | `error("…")` | |
| Unity `Debug.Log(x)` | `print("…")` | |
| `nameof(x)` | `"x"` | |
| `String.Empty` | `""` | |
| `String.IsNullOrEmpty(s)` | `empty(s)` | |
| `x.ToString()` | `"{x}"` | |
| `Math.PI` / `MathF.PI` | `PI` | `math` |
| `Math.Sqrt/Sin/Cos/Tan/Asin/Acos/Atan/Atan2/Pow/Abs/Round/Max/Min/Log/Exp/Clamp(...)` | `sqrt/sin/cos/tan/asin/acos/atan/atan2/pow/abs/round/max/min/log/exp/clamp(...)` | `math` |
| `Math.Ceiling/Floor(x)` | `ceil(x)` / `floor(x)` | `math` |
| (`MathF.*` maps identically to `Math.*`) | | `math` |

### Collections — `List<T>` (receiver `self`)

| C# | das |
|----|-----|
| `self.Add(x)` | `self.push(x)` |
| `self.Clear()` | `self.clear()` |
| `self.RemoveAt(i)` / `self.RemoveRange(...)` | `self.erase(...)` |
| `self.Remove(x)` | `self.remove_value(x)` |
| `self.Insert(i, x)` | `self.push(x, i)` (note: args reversed) |
| `self.Contains(x)` | `self.has_value(x)` |
| `self.IndexOf(x)` | `self.find_index(x)` |
| `self.Sort()` | `self.sort()` |
| `self.Count` | `self.length()` |
| `array.Length` (C# `Array`) | `array.length()` |

### Delegates / events

| C# | das |
|----|-----|
| `d.Invoke(args)` | `d.invoke(args)` |
| `Action` type | `lambda` |
| Unity `UnityEvent.Invoke(...)` | `self.Invoke(...)` |
| Unity `UnityEvent.AddListener(cb)` | `self.AddListener(cb)` (single arg: `self <- cb`) |
| Unity `UnityEvent.RemoveListener(cb)` | `self.RemoveListener(cb)` |

### Unity engine types

| C# | das | require / note |
|----|-----|------|
| `MonoBehaviour` | `Component` | base class |
| `GameObject` | `NodeId` | not a pointer |
| `new GameObject("n")` | `create_node([[NodeData() name="n"]])` | |
| `Component`/`GameObject`.`gameObject` / `.transform` | `.nodeId` | |
| `GameObject.activeSelf` | `.nodeId.isActive` | |
| `GameObject.activeInHierarchy` | `.nodeId.isActiveInHierarchy` | |
| `go.SetActive(b)` | `go.set_active(b)` | |
| `comp.GetComponent<T>()` / `go.GetComponent<T>()` | `self.get_component(type<T>)` | |
| `go.AddComponent<T>()` | `go.add_component(...)` | |
| `Object.DontDestroyOnLoad(x)` | (no-op in EdenSpark; drop or comment) | |
| `Color` | `float4` | |
| `Vector3` | `float3` | |
| `Vector3.magnitude` | `self.length()` | |
| `Vector3.sqrMagnitude` | `self.length_sq()` | |
| `Vector3.normalized` | `self.normalize()` | |
| `Vector3.zero/one` | `float3(0)` / `float3(1)` | |
| `Vector3.left/right` | `float3(1,0,0)` / `float3(-1,0,0)` | |
| `Vector3.up/down` | `float3(0,1,0)` / `float3(0,-1,0)` | |
| `Vector3.forward/back` | `float3(0,0,1)` / `float3(0,0,-1)` | |
| `Time.time` | `get_time()` | `engine.time` |
| `Time.deltaTime` | `get_delta_time()` | `engine.time` |
| `Application.OpenURL(u)` | `open_url(u)` | |

### Transform (receiver is the component; `.transform` is dropped — EdenSpark works on the node)

| C# | das |
|----|-----|
| `t.localPosition` (read) | `.position` |
| `t.localRotation` (read) | `.rotation` |
| `t.localScale` (read) | `.scale` |
| `t.localPosition = v` | `node.set_position(v)` |
| `t.localRotation = q` | `node.set_rotation(q)` |
| `t.localScale = s` | `node.set_scale(s)` |

> Unity expresses transforms through a `Transform` component reached via `.transform`; EdenSpark
> operates directly on the node (`NodeId`). When translating, **drop the `.transform` hop** and apply
> the position/rotation/scale to the node.

### Unity UI

Unity UI types map to EdenSpark's UI components — `UIImage`, `UIText`, `UIButton`, `UIFrame`, etc.
See the framework guide and the **ui-builder** agent for how EdenSpark UI is built (UICanvas,
`UIFrame` for layout/anchors, the UI component fields). Map `Image`→`UIImage`, `Text`/`TMP_Text`→
`UIText`, `Button`→`UIButton`, `RectTransform`→`UIFrame`, and translate their fields to the
corresponding EdenSpark component fields. Don't assume field names match Unity's — check the
component definition.

### Animation / tweening (DOTween → `engine.tweener.tween`)

EdenSpark has a built-in tween module — `require engine.tweener.tween` (or `engine.core`). All tween
functions take a `NodeId` target and return a `Tween?` you can chain with `.on_complete(...)`,
`.set_easing(...)`, `.set_loops(count, LoopType.Restart|Yoyo)`. Easing is a function passed as
`@@inOutQuintic` etc.

| C# (DOTween) | das (`engine.tweener.tween`) |
|--------------|------------------------------|
| `t.DOScale(to, dur)` | `scale_tween(node, to, dur)` |
| `t.DOMove(to, dur)` / `DOLocalMove` | `position_tween(node, to, dur)` |
| `t.DORotate(deg, dur)` / `DOLocalRotate` | `rotation_tween_degrees(node, deg, dur)` (radians: `rotation_tween`) |
| `img.DOFade(a, dur)` / arbitrary value | `create_tween(node, from, to, @(target, v) { … }, dur)` — generic setter tween |
| `.SetEase(ease)` | `.set_easing(@@ease)` |
| `.SetLoops(n, LoopType.Yoyo)` | `.set_loops(n, LoopType.Yoyo)` |
| `.OnComplete(cb)` | `.on_complete(cb)` |
| `DOTween.Sequence()` | `create_tween_seq()` |
| `seq.Append(tween)` | `next(seq, tween)` |
| `seq.Join(tween)` | `join(seq, tween)` |
| `seq.PrependInterval(t)` / `AppendInterval` | `add_start_delay(seq, t)` / `add_delay(seq, t)` |
| `t.Kill()` / `DOTween.Kill(target)` | `complete_tweens(node)` (or `complete_tween(tween)`) |

```das
var t = scale_tween(node, float3(2, 1, 2), 1.0).set_loops(-1, LoopType.Yoyo).on_complete(@() { print("done"); })
var seq = create_tween_seq()
next(seq, position_tween(node, node.localPosition + float3(0, 0.1, 0), 0.2, @@inOutQuintic))
```

Verify exact function names/overloads against the tween docs — there are many `*_tween` variants
(float/float2/float3/float4, with/without explicit `from`).

## 9. Project-specific mappings

Game-specific controllers, services, save systems, analytics/SDK calls, custom singletons
(`X.Instance → get_x()`) etc. are **not** in this skill — they depend entirely on the target game's
architecture. When you hit such a type:

1. Look for the EdenSpark equivalent in the project (controllers, services, framework guide).
2. If there's a documented singleton/accessor, use it (e.g. a C# `Foo.Instance` typically becomes a
   `get_foo()` accessor).
3. If there's no equivalent yet, port the dependency too, or stub it and note it in a comment so the
   compile-logs loop surfaces it.

## 10. Gotchas

- **Pointers/null:** das class instances are pointers (`T?`); structs/primitives are not. Member
  access and calls use `.` in all cases. Mind nullability when translating C# reference types.
- **`let` vs `var`:** use `let` for values you don't reassign, `var` for ones you do (see the
  framework guide for the project's exact rule).
- **Don't invent EdenSpark APIs.** If you're unsure a function exists, look it up before writing it:
  query **Context7** for EdenSpark/Daslang API documentation, use the **EdenSpark MCP tools** to
  inspect the running game's code/scene, and check the framework guide / docs / samples — or just let
  the compiler tell you. A plausible-but-wrong call is worse than a `// TODO`.
- **Keep units small** so each compile-read-fix cycle stays cheap.
