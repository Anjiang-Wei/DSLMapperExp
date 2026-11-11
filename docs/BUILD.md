# Dependencies and build notes

## Dependencies

The implementation targets Legion's control-replication mapping interface.
The archived sources use the Legion/Regent API from the 22.03-era development
branch. A compatible Legion installation is required; the runtime and compiler
toolchain are external dependencies. Generic upstream documentation is at
<https://legion.stanford.edu/> and <https://regent-lang.org/>.

The C++ mapper uses C++14. GPU applications require CUDA and cuBLAS; matrix
benchmarks also use BLAS, HDF5, and OpenMP. Distributed execution requires a
Legion build with a supported network backend. Set installation locations
through environment variables or CMake search paths on the local machine.

## Mapper

`mapper/dsl_mapper.cc` includes the generated parser and scanner. Applications
register the DSL mapper through the registration function in `dsl_mapper.h`.
`mapper/Makefile` builds the mapper shared library using `LEGION_DIR`, `CUDA`,
and `CXX` supplied by the caller.

## Regent applications

Application entry points are `circuit_sparse.rg`, `stencil_fast.rg`, and
`pennant.rg` in `benchmarks/regent/`. Their source files contain the original
mapper-compilation and registration hooks. Supply Regent's runtime/bindings
include directories through `INCLUDE_PATH`, and add this directory to Regent's
module search path. Pennant's mesh input files can be obtained with the Regent
examples; only application source and mapping policies are included here.

Passing `-dslmapper -mapping POLICY` selects the DSL mapper where supported by
the application's registration hook. The corresponding C++ mapper remains in
the application source for comparison.

## Matrix multiplication

`benchmarks/gemm/CMakeLists.txt` builds the six generated applications against
an installed Legion package. Set `CMAKE_PREFIX_PATH` to the dependency install
prefixes. For CPU builds, configure with `MAPPLE_WITH_CUDA=OFF`. For GPU builds,
set `MAPPLE_WITH_CUDA=ON` and `CMAKE_CUDA_ARCHITECTURES` to the intended GPU
architecture. Each application keeps its original command-line interface;
`-dslmapper -mapping POLICY` selects a DSL policy. Processor counts and launch
parameters must match the selected policy.

The CMake file supplies portable dependency discovery and does not submit jobs.
Runtime API compatibility and GPU execution depend on the installed toolchain.
