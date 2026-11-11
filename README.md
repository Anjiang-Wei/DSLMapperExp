# Mapple code artifact

This repository provides the mapper implementation, application source code,
and mapping policies accompanying **Mapple: A Domain-Specific Language for
Mapping Distributed Programs**.

## Contents

| Directory | Contents |
| --- | --- |
| `mapper/` | C++ mapper, DSL scanner/parser, processor-space transformations, and factor-selection code |
| `benchmarks/regent/` | Circuit, Stencil, and Pennant applications and C++ mappers |
| `benchmarks/gemm/` | Cannon, SUMMA, PUMMA, Johnson, Solomonik, and COSMA implementations, generated kernels, and shared C++/CUDA support |
| `policies/` | Original and revised DSL policies for the nine applications |
| `examples/cosma-case/` | Mapping policies illustrating alignment of placement tasks with GEMM tasks |
| `docs/` | Dependency, build, and language documentation |

The source snapshot includes the compiler-generated parser and scanner so
reviewers can inspect the implementation without regenerating them. Embedded
copies of mapper/compiler files preserve the applications' original include
layout. These copies are identical to `mapper/`.

See [build notes](docs/BUILD.md), [language notes](docs/LANGUAGE.md), and
[source notices](NOTICE.md).
