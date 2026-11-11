# COSMA placement example

These policies express the mapping functions shown in the case study using the
archived DSL syntax. With task space `(8,1,1)` and four GPUs, `original.dsl`
places A/B tiles cyclically and assigns GEMM tasks in blocks; `improved.dsl`
assigns their placement tasks with the same block function. Both policies
keep the GEMM mapping unchanged.

The application computes `A = B C`. Its placement tasks are `task_1` (A),
`task_2` (B), and `task_3` (C); `task_4` performs the GEMM. The later read-only
`task_1` completes the A output. The example uses a processor space containing
all four GPUs and does not depend on a scheduler-specific launcher.
