# Mapping policies and implementation names

The archived implementation uses brace-delimited function bodies, semicolons,
and a `Task` argument with `task.ipoint` and `task.ispace` fields. The paper
uses simplified function notation for readability.

`Machine(GPU)` gives a processor space indexed by node and local GPU.
`split`, `merge`, and `swap` transform this space. The implementation name
`auto_split` corresponds to the paper's `decompose` primitive; `balance_split`
is the shape-independent alternative. The scanner, grammar, and transformation
implementation are included in `mapper/compiler/`.

Policies use `IndexTaskMap` to associate task names with mapping functions,
`Task` to choose processor kinds, `Region` for memory placement, and `Layout`
for layout constraints. The implementation names `CollectMemory` and
`InstanceLimit` correspond to the paper's garbage-collection and backpressure
directives. Inspect the example policy files for the executable syntax.

Each application directory in `policies/` contains the archived `original.dsl`
and `improved.dsl` policies. The separate COSMA example expresses the case
study's cyclic placement and aligned block placement using the archived
implementation syntax, with all GPUs visible in one processor space.
