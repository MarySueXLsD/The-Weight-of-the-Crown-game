---
name: prefab-format
description: Reference for the EdenSpark prefab/scene file format - .prefab (BLK-based). Use whenever you need to read, edit, or author a .prefab file by hand - understanding node blocks, component field encodings, parameter type tags (t/i/r/p3/p4/b/i64/...), resource references (res/guid/refId), complex node references (internalRef/externalRef), and prefab inheritance/diffs.
---

# EdenSpark Prefab File Format (`*.prefab`)

A reference for reading, editing, and authoring EdenSpark prefab/scene files (`*.prefab`). The format is
BLK - Dagor's text container format - with an application-specific schema layered on top: the
`node`/`res`/`diff`/`internalRef`/etc. blocks, per-component sub-blocks, and the value encodings for component fields.

---

## 1. BLK Container Syntax

The BLK container format itself (blocks, `name:type=value` parameters, the type-tag set
`t/i/r/p2/p3/p4/ip2/ip3/ip4/b/i64`, string quoting and `~`-escaping) is documented in the
project's `CLAUDE.md` under **BLK File Format** — read that section first if you are not
familiar with BLK. This skill covers only the prefab schema layered on top of it.

Note: later in this skill, a param's name is written as `name:type` (or just `name` when the type is undefined), and a block's name as `name{}`.

---

## 2. Prefab Document Structure

A prefab file is a BLK document whose top level is an implicit root block (no surrounding braces).
Its children are a flat, ordered list of these blocks:

| Top-level block | Purpose                                                                 |
|-----------------|-------------------------------------------------------------------------|
| `node{}`        | One scene node (transform + components). The main content.              |
| `res{}`         | Resource table entry - maps a numeric `refId:i64` to an asset GUID.     |
| `internalRef{}` | Node reference resolved in nested prefab instances.                     |
| `externalRef{}` | Node reference resolved in an enclosing prefab.                         |
| `diff{}`        | Override of a nested prefab instance/inherited prefab.                  |

Nodes are stored flat (not physically nested). Parent/child relationships are expressed by the
`parent:i` parameter inside each child `node{}` (it holds the parent node's `uid`), not by block nesting. Order of `node{}` blocks is also the sibling order in the scene tree. Only one prefab root can exist.

A minimal valid prefab is a single node:

```
node{
name:t="Root"
uid:i=-392801227
}
```

---

## 3. The `node` Block

Each `node{}` describes one scene node. Parameters are optional unless noted; omitted optional
parameters take their default, and the serializer omits anything equal to its default to keep files
compact (e.g. identity transform components are not written).

### 3.1 Node parameters

| Param                  | Required | Default      | Meaning |
|------------------------|----------|--------------|---------|
| `uid:i`                  | yes      | -            | Node's unique id within this prefab, excluding nested instances. A random non-zero int. Stable identity used by refs and diffs. |
| `name:t`                 | yes      | -            | Display name of the node. Can be empty. Default name depends on scene. |
| `parent:i`               | no       | -            | `uid` of the parent node in this file. If absent, the node is a root of the prefab. |
| `pos:p3`                 | no       | `0, 0, 0`    | Local position. Omitted when zero. |
| `rot:p4`                 | no       | `0, 0, 0, 1` | Local rotation **quaternion** (x, y, z, w). Omitted when identity. |
| `scl:p3`                 | no       | `1, 1, 1`    | Local scale. Omitted when one. |
| `active:b`               | no       | `yes`        | Node active flag. Written only when `no`. |
| `world_mode:b`           | no       | `no`         | Attachment mode is `AttachmentMode.World` (vs. parent-local). Written only when `yes`. |
| `prefab:i64`             | no       | -            | If present, this node is the root of a nested prefab instance; value is a `refId:i64` into the `res{}` table pointing at the referenced `.prefab` asset. |
| `isRenderSettingsNode:b` | no       | -            | Marks the node holding scene render settings. Written only when `yes`. |
| `at:i`                   | no       | -            | Child index used when inserting new nodes into a prefab instance. |

### 3.2 Child blocks

After its parameters, a `node{}` contains zero or more component blocks - one child block per
component attached to the node. The block name is the component type name; its contents are the
component's serialized fields.

Example (a node with a transform override and two components):

```
node{
name:t="mesh"
uid:i=-800144537
parent:i=1696518073
scl:p3=4, 4, 4
Mesh{
__meshId:i64=5696195008224956559
__materialId:i64=-5100174104377386981
visibility:i=2047
isStatic:b=no
}
}
```

---

## 4. Components and Field Encodings

A component is a child block of a `node{}`. The block name is the component's type name (e.g. `Mesh{}`,
`RigidBody{}`, `Collider{}`, `UIFrame{}`, or user-defined component like `Pig{}`).

**A component is serialized as a struct:** each field becomes a param or child block named after
the field (or its `@serialize_name`). Nested `struct` fields follow the same rule recursively —
a struct field named `control` becomes a `control{}` child block, and inside it the struct's own
fields expand as params/blocks exactly as they would at the top level.

All components serialize into the same block shape and follow the same field-encoding rules,
regardless of where the component type is defined.

### 4.1 Field serialization rules

Each serializable field becomes either a parameter (for scalar/"flat" types) or a child block (for composite types).

A field is skipped (not written) when:

- it is `const`;
- it is `private` without an explicit `@export` annotation;
- or has `@no_export` annotation;
- it is a special framework field (`__rtti`, `__finalize`, and for fields `thisHash`, `nodeId`);
- it is an unserializable type (e.g. a lambda, a non-component pointer);
- its serialized size exceeds the internal field-size limit (very large containers).

Field renaming: a field annotated with `@serialize_name=otherName` is written under `otherName`
instead of its declared name.

Example:

```
@serialize_name="hp"
healthPoints : int = 5

hp:i=5
```

> Resource-typed fields (and resource-typed elements inside containers/variants) are written with
> a `__`-prefixed key (e.g. `__meshId`, `__materialId`, `__textureId`). When a resource id appears as
> a container element or variant payload, `__` is added to key name, so `v` becomes `__v` and
> `k` becomes `__k`. The `__` prefix is how serializer recognizes a value as a resource reference.

### 4.2 Field type encoding map

Field types map onto BLK params/blocks as follows:

#### Flat types -> parameters

In the examples below, the param is named `name`.

| Daslang type                             | BLK encoding                              | Notes |
|------------------------------------------|-------------------------------------------|-------|
| `bool`                                   | `name:b=yes`, `name:b=no`                 | |
| `int8/16/32`, `uint8/16/32`, `bitfield`s | `name:i=<int>`                            | All small ints widen to `i`. |
| `int64`, `uint64`                        | `name:i64=<int64>`                        | |
| `double`                                 | `name:i64=<bits>`                         | Stored as the **raw 64-bit bit pattern** of the double, not a readable decimal. Do not hand-edit. |
| `float`                                  | `name:r=<float>`                          | |
| `float2`                                 | `name:p2=x, y`                            | |
| `float3`                                 | `name:p3=x, y, z`                         | |
| `float4`, `quat4`                        | `name:p4=x, y, z, w`                      | |
| `int2`/`uint2`, `range`/`urange`         | `name:ip2=x, y`                           | |
| `int3`/`uint3`                           | `name:ip3=x, y, z`                        | |
| `int4`/`uint4`                           | `name:ip4=x, y, z, w`                     | |
| `range64`/`urange64`                     | `name:p4=<bits>`                          | Packed into a Point4 bit pattern. |
| `string`                                 | `name:t=<quoted string>`                  | |
| `enum` (any width)                       | `name:t=<label>` or `name:i=<int>`        | Daslang components serialize enums **by label string**; native (C++ ECS) components serialize enums **as integers**. Both forms are valid depending on the component. |
| `NodeId`                                 | `name:i=<node_ref_id>`                    | A reference id (not the raw NodeId). If the node is present in current prefab, equals `uid` of referenced node. `0` means no node. |
| Resource id handle (e.g. `MeshId`)       | `__name:i64=<resource_ref_id>`            | `__`-prefixed; `i64`. `0` means no resource. |
| Component pointer (`SomeComp?`)          | `name:i=<node_ref_id>`                    | Serialized as a reference to owning node. `0` means null. |

#### Composite types -> child blocks

Composite values become sub-blocks. The block name is either:
1. the field name (for a struct or tuple field), or
2. a default type-specific key otherwise (when inside nested containers)

| Composite               | Default block key |
|-------------------------|-------------------|
| `struct`                | the struct's type name |
| `array<T>` (dynamic array) or `T[N]` (fixed array) | `ar` |
| `table<K,V>` (map) or `table<K>` (set) | `ta` |
| `tuple`                 | `tu` |
| `variant`               | `va` |

How to read the examples below: the das declaration comes first, then its blk serialization.

##### Structs - struct

A struct field becomes a child block named after the field. Its own fields expand inside that block
using the same rules recursively.

```
struct Bounds {
    min : float3
    max : float3
}

class Box : Component {
    label : string
    bounds : Bounds
    nested : Bounds  // same struct type, different field name → different block name
}

Box{
label:t="crate"
bounds{
min:p3=-0.5, 0, -0.5
max:p3=0.5, 1, 0.5
}
nested{
min:p3=0, 0, 0
max:p3=1, 1, 1
}
}
```

When a struct appears inside a container (e.g. `array<Bounds>`), the block name is the struct's
**type name** (`Bounds`) instead of the field name — see the Arrays example below.

##### Arrays - array<T>

Each element is `v`/`__v` for flat element types, or a sub-block for composite element types.
The array's size is implicit (the number of params / sub-blocks).


Examples:
```
array_of_ints : array<int> = [1, 2, 3]

array_of_ints{
v:i=1
v:i=2
v:i=3
}
```

```
double_strings_array : array<array<string>> = [["hello", "world"], [], ["bye world"]]

double_strings_array{
ar{
v:t="hello"
v:t="world"
}
ar{}
ar{v:t="bye world"}
}
```


##### Maps - table<K, V>

A table with values serializes as two parallel sub-blocks: `ks{}` (keys) and `vs{}`
(values), index-aligned. Be careful with mutating the table! You'll need to make sure key-value pairs have identical indices in both blocks.
Keys are always flat and have `k`/`__k` param names. Keys are emitted in a stable sorted order (lexicographically).
Values follow the same rules as arrays - params named `v`/`__v` or sub-blocks with variable names.

Examples:
```
string_keys : table<string, int> = {"hello" => 413, "world" => 612}

string_keys{
ks{
k:t="hello"
k:t="world"
}
vs{
v:i=413
v:i=612
}
}
```

```
nodes_to_strings : table<NodeId, array<string>> = {}

nodes_to_strings{
ks{
k:i=-89231234
k:i=928345324
}
vs{
ar{
v:t="idle"
v:t="walk"
v:t="run"
v:t="jump"
}
ar{
v:t="open"
v:t="close"
}
}
}


```

##### Sets - table<K>

Like arrays, but param names are `k`/`__k`, like in `ks{}` block of tables

Example:
```
prefabs : table<PrefabId> = {request_mesh("Root.prefab"), request_mesh("Player.prefab"), request_mesh("Enemy.prefab")}

prefabs{
__k:i64=5696195008224956559
__k:i64=1977605499872587940
__k:i64=7989592335569467581
}
```

##### Variants - variant<...>

The variant becomes one block (the field name, or `va`). Inside that block is current index `i:i`,
then the value - `v`/`__v` for a flat payload, or a block of corresponding name for composite value.

Example:

```
typedef ExampleVariant = variant<one : int, two : array<int>, three : array<array<int>>>
stuff : ExampleVariant = ExampleVariant(three = [[1, 1, 2, 3, 5]])

stuff{
i:i=2
ar{
ar{
v:i=1
v:i=1
v:i=2
v:i=3
v:i=5
}
}
}
```

##### Tuples - tuple<...>

Each entry is by default keyed `_0`, `_1`, etc. If names are provided, they are used instead, just like a struct.

Examples:

```
return_value : tuple<int, string> = (1, "failed")

return_value{
_0:i=1
_1:t="failed"
}
```

```
people : array<tuple<name : string, surname : string, age : int>> = [(name="Alice", surname="Smith", age=30), (name="Bob", surname="Jones", age=25)]

people{
tu{
name:t="Alice"
surname:t="Smith"
age:i=30
}
tu{
name:t="Bob"
surname:t="Jones"
age:i=25
}
}
```


---

## 5. Resources

### 5.1 Resource reference (`res{}`)

Asset references are indirect: a component stores a numeric `refId:i64`, and a top-level
`res{}` block maps that `refId:i64` to a stable asset GUID. This keeps the asset's identity stable
even if numeric ids change. `res{}` blocks are placed once per resource. Additional placement rules:
1. For prefab instances, `res{}` block is placed right under `node{}` that is instance root.
2. For all other resources, `res{}` blocks are placed underneath all nodes, in the order they were used.

| Param       | Meaning |
|-------------|---------|
| `guid:t`    | Canonical asset GUID (UUID). The real, portable identity of the asset. |
| `id:t`      | Optional sub-asset selector (e.g. `"RootNode"`) naming which sub-resource inside the asset - usually needed to pick a specific mesh inside a model. Written only when non-empty. Feeds the `refId` hash, so the same `guid`/`type` with a different `id` yields a different `refId`. |
| `type:i`    | Resource type code (e.g. mesh, material, texture, prefab - ResourceFabriqueType enum). |
| `refId:i64` | The numeric id referenced by component data and by `prefab` on nodes. |

```
enum class ResourceFabriqueType : uint8_t
{
  Invalid = 0,
  Mesh = 1, // this need to be sure that ResourceId{} has no valid fabrique
  Texture = 2,
  Material = 3,
  Model = 4,
  Sound = 5,
  Animation = 7,
  Skeleton = 8,
  AnimationMask = 9,
  Text = 10,
  Font = 11,
  Prefab = 12,
  Collision = 13,
  UserShader = 14,
  Count
};
```

Example:

```
node{
name:t="prefab1"
uid:i=941118004
prefab:i64=-5878347360703098831
parent:i=-969784256
}
res{
guid:t="019e986d-cfdc-759c-856d-cc55775b1004"
type:i=12
refId:i64=-5878347360703098831
}
node{
name:t="prefab2"
uid:i=-621000637
prefab:i64=-5878347360703098831
parent:i=-969784256
}
node{
name:t="cube1"
uid:i=-1429078221
parent:i=-969784256
pos:p3=0, 8.58579, -8.58579
Mesh{
__meshId:i64=4481307235788880410
__materialId:i64=0
visibility:i=2047
isStatic:b=no
}
}
node{
name:t="cube2"
uid:i=-1485638760
parent:i=-969784256
pos:p3=0, 8.58579, -8.58579
Mesh{
__meshId:i64=4481307235788880410
__materialId:i64=0
visibility:i=2047
isStatic:b=no
}
}
node{
name:t="empty_node"
uid:i=-1233441528
parent:i=-969784256
pos:p3=0, 8.58579, -8.58579
}
res{
guid:t="0193c180-91e6-7806-87dd-19e8d41cd80f"
type:i=1
refId:i64=4481307235788880410
}
```

### 5.2 How components reference a resource

Note that, although `prefab:i64` holds a reference to a resource, it does not need a `__` prefix, since it is not part of any component.

```
Mesh{
__meshId:i64=4481307235788880410
__materialId:i64=0
visibility:i=2047
isStatic:b=no
}
...
res{
guid:t="0193c180-91e6-7806-87dd-19e8d41cd80f"
type:i=1
refId:i64=4481307235788880410
}
```

To resolve: take the field value (4481307235788880410) -> find the `res{}` whose `refId:i64` matches -> read its `guid:t` ("0193c180-91e6-7806-87dd-19e8d41cd80f").

A `refId:i64` of `0` means no resource (null).

---

## 6. Node references

When a component field references another node (a `NodeId` field, or a component pointer), the node
is not stored inline. Instead, the field stores a small integer reference id. If the target node is part of
the current prefab without nesting, the reference id is just the `uid` of the target node. There are
two exceptions, where the reference id is matched against the `ref:i` param in
`internalRef{}` or `externalRef{}` blocks.

A reference id of `0` means no reference (null) - `uid`s are always nonzero, so `0` can never name a real node.

1. Target node is inside one of the nested prefabs

Let's take this tree. `-` denotes a depth of child relation. Names with capital letters denote prefab roots.
Number after the name is uid of the node.

```
A
-a1        -1515316738
-a2
-B         -577591677
--b1
--b2
--C        -818200766
---c1      -1674109454
-D          93949949
--d1       -529163576
```

Suppose node `a2` holds a reference to `c1`. The reference is then resolved with `internalRef{}`
by walking down the roots of nested instances. `ref:i` is calculated by hashing uids together, so
one ref points to a unique node within a prefab tree.

```
internalRef{
ref:i=2011617459
uid:i=-1674109454
path{
uid:i=-577591677
uid:i=-818200766
}
}
```

2. Target node is resolved in the enclosing prefab. This is possible when a NodeId field is set by that external prefab.
  This case is similar to `internalRef{}`, but we first walk up by `up:i` levels


Using the example above, if `c1` references `a1`, this block is added:

```
externalRef{
ref:i=-1515316676
up:i=2
uid:i=-1515316738
}
```

and `c1` references `d1`:

```
externalRef{
ref:i=-1911681492
up:i=2
uid:i=-529163576
path{uid:i=93949949;}
}
```

To summarize:

| Param                          | Meaning |
|--------------------------------|---------|
| `ref:i`                        | The reference id used. |
| `uid:i`                        | The `uid` of the target node. |
| `path{}`                       | Ordered list of nested-prefab-root `uid`s to descend through to reach the target's prefab scope. |
| `up:i` (`externalRef{}` only)  | How many prefab levels to ascend before applying `path{}`. |

Note that these cases are rare.

---

## 7. Prefab Inheritance and Diffs

EdenSpark prefabs support nesting and inheritance: a node can be a root of an instance of another
prefab and override parts of it (individual component fields, add/remove components, add/remove nodes).
The instance is not expanded; instead only the differences from the base prefab are recorded in `diff{}` blocks.
This is what makes inheritance compact and update-safe.

Prefab inheritance is a special case of prefab nesting where the inherited prefab's root is also the
instance root. All other rules still apply.

### 7.1 A nested-prefab instance node

```
node{
name:t="Simple"
uid:i=-1491868787
prefab:i64=-4937892710858415099    // refId -> res -> the base .prefab asset
parent:i=-2012898917
}
res{
guid:t="0194d681-7671-78f0-bc62-d57c59ae7cdf"
type:i=12                          // type 12 = prefab
refId:i64=-4937892710858415099
}
```

This node says - instantiate the prefab whose GUID is "0194d681-7671-78f0-bc62-d57c59ae7cdf" here. If there are no overrides,
that's all - the children come from the base prefab.

### 7.2 The `diff` block

When an instance overrides something, a `diff{}` block is emitted. It is keyed by the
instance root's uid via `root:i` and contains the same kinds of children as a prefab body, but
holding only the changes:

- `node{}` - per-node overrides (matched to the base by `uid`). Component overrides inside contain only the changed fields.
  Note that fields change fully - overriding individual indices of arrays is not supported.
- `newNodes{}` - nodes added on top of the base prefab. The `node{}` blocks inside might contain an `at:i` field that
  tells where to place the new node. If absent, new nodes are anchored to the end
- `removedNodes{}` - uids of base prefab nodes that are deleted in this instance.
- Within a node override: `newComps{}` for added components, and
  `removedComps{}` for removed components, which contain `componentName:t`s.
- `diff{}` - nested diffs (overrides of prefabs nested inside this prefab), applied
  innermost-first.
- `res{}` entries for any resources newly referenced by the diff.

Diff blocks are placed at the very end of the file, after all `res{}` blocks. A diff is applied to a fresh copy of the base prefab to reconstruct the final instance.

Example:

Instance root:
```
node{
name:t="title"
uid:i=53594071
prefab:i64=2143795894821049952
parent:i=1220837769
pos:p3=0, -70, 0
}
res{
guid:t="019a8fab-80e6-7d29-a689-021793a2a5fc"
type:i=12
refId:i64=2143795894821049952
}
```

Diff:
```
diff{
root:i=53594071
node{
uid:i=-1126476080
UIFrame{localPosition2D:p2=400, 70;}
UIText{text:t="GAME OVER";}
}
}
```

Base prefab:
```
node{
name:t="title"
uid:i=-1126476080
UIFrame{
localPosition2D:p2=0, 0
size:p2=800, 140
pivot:p2=0.5, 0.5
}
UIText{
text:t="<title>"
color:p4=1, 0.8, 0.6, 1
fontSize:r=80
autoResizeFrame:b=no
__fontId:i64=0
effect:i=0
effectColor:p4=1, 1, 1, 1
effectOffset:p2=0, 0
effectThickness:r=0
fontAutoSize:p2=0, 0
wordWrapping:b=yes
margin:p4=0, 0, 0, 0
horAlignment:i=1
vertAlignment:i=1
}
}
```

### 7.3 Diff matching rules (how to read/produce them)

- Nodes are matched between instance and base **by `uid`**, not by name or position.
- A node present in the base but missing from the instance -> recorded in `removedNodes{}`.
- A node present in the instance but not the base -> recorded in `newNodes{}`.
- For matched nodes, only fields whose values differ from the base are written. Transform fields
  (`pos:p3`/`rot:p4`/`scl:p3`), `active:b`, `world_mode:b`, and `name:t` are diffed individually;
  The **root node's transform/name is not diffed** (the instance's own node params govern placement).
- Float comparisons use a relative-epsilon equality, so tiny float noise does not create spurious
  diffs.


---

## 8. Editing Guidance

When modifying a `*.prefab` file:

### 8.1 Safe edits (low risk)

- Changing scalar field values inside a component (e.g. `mass:r=1` -> `mass:r=2`, `isStatic:b=no` ->
  `isStatic:b=yes`, a `color:p4=...`). Keep the type tag unchanged and the value in the right arity.
- Editing transform params on a node (`pos:p3`/`rot:p4`/`scl:p3`). Remember, `rot:p4` is a **quaternion**
  (`x, y, z, w`), not Euler angles, and value of `0, 0, 0, 1` is identity.
- Editing a name `name:t="Foo"` -> `name:t="Bar"`.
- Adding a self-contained component block to a node.
- Adding a new top-level `node{}` with a fresh unique `uid` and a `parent:i` pointing at an
  existing node's `uid`.

### 8.2 Edits requiring care

- `uid` values are identity. Do not reuse a `uid` that already exists in the file, and do not
  renumber existing `uid`s - refs (`NodeId` fields/component pointers/`parent`/`internalRef`/`externalRef`),
  diffs (`root:i`/`removedNodes{}`/node matching) all key off them. New nodes need a new, unique non-zero `uid`.
- Resource references. To point a `__name:i64` field (or `prefab:i64`) at an asset, the matching
  `res{}` entry with the correct `guid:t`/`type:i`/`refId:i64` must exist. Don't invent GUIDs - reuse an
  existing `res{}` entry's `refId:i64`, or you must add a `res{}` whose `guid:t` is a real asset GUID.
- Diffs. Editing `diff{}` blocks requires understanding the base prefab;

### 8.3 Do not edit

- `double` fields encoded as `i64`, and `range64` and `urange64` are written as `p4` (raw bit pattern) -
  not human-readable; round-trip through the editor instead.
- `uint`, `uint2` (same with `urange`), `uint3` and `uint4` are serialized as `i`, `ip2`, `ip3` and `ip4`
  respectively, so negative values will mean positive

### 8.4 General rules

- Preserve block/parameter order unless the change is specifically about reordering.
- Keep type tags correct: a value's tag must match its component field's declared type, or
  deserialization will silently skip the field (it looks up the param by name and type).
- Enum-valued fields are serialized either as a **label string** (`orientation:t="Horizontal"`) or as an **integer** (`horAlignment:i=1`), depending on whether the component is implemented in Daslang or as a native C++ ECS component. When editing, match the form already present in the file.
- Omitting an optional field is fine - it falls back to the component's default. Conversely, you can
  delete a param to reset it to default, although it will require prefab resave from user, use sparingly.
- When in doubt about a component's field set and types, inspect the component's type definition
  (a `class MyComponent: Component`) to see which fields exist and what types they are.
