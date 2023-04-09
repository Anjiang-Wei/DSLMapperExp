# DSLMapperExp
```
git clone git@github.com:Anjiang-Wei/DSLMapperExp.git
cd DSLMapperExp
git submodule init
git submodule update
```

## Stencil, Circuit, Pennant:

Install Legion:
```
cd legion/language
module load gcc/7.3.1
module load cmake/3.14.5
module load cuda/11.7.0
CC=/usr/tce/packages/gcc/gcc-7.3.1/bin/gcc CXX=/usr/tce/packages/gcc/gcc-7.3.1/bin/g++ USE_CUDA=1 USE_GASNET=1 CONDUIT=ibv ./scripts/setup_env.py --terra-cmake |& tee log
```

Compile and Submit Jobs (take stencil as an example):
```
# hand-tuned C++ mapper, hand-tuned Maple mapper
./pldi23_scripts/build_stencil.sh stencil.run1
cd stencil.run1 && for n in 1 2 4 8 16 32 64; do bsub -nnodes $n bsub_stencil.lsf; done

# hand-tuned C++ mapper, hand-tuned default Maple
./pldi23_scripts/build_stencil.sh stencil.run2
cd stencil.run2 && for n in 1 2 4 8 16 32 64; do bsub -nnodes $n bsub_stencil_try.lsf; done
```

Parse results:
```
../pldi23_scripts/parse_results.py
```

## Distributed Matrix-Multiplication Algorithms:

Install DISTAL:
```
module load gcc/7.3.1
module load cmake/3.14.5
module load cuda/11.7.0
cd taco
# refer to instructions in scripts/lassen_install_latest_nohang.py

git submodule init
git submodule update
# first install Legion
python3 scripts/lassen_install_latest_nohang.py --openmp --sockets 2 --cuda --dim 3 --multi-node --threads 20 --no-tblis |& tee log
git checkout build
git checkout legion/cannonMM/
```

Compile and Submit Jobs (take Cannon as an example):
```
cd build
LLNL_COMPUTE_NODES=1 cmake -DTACO_CUDA_LIBS=/usr/tce/packages/cuda/cuda-11.7.0/lib64 -DCMAKE_BUILD_TYPE=Release ..
make -j cannonMM-cuda
cd cannonMM-cuda
# hand-tuned C++ mapper, hand-tuned Maple mapper
for n in 1 2 4 8 16 32 64; do bsub -nnodes $n l.lsf; done

# hand-tuned C++ mapper, hand-tuned default Maple
for n in 1 2 4 8 16 32 64; do bsub -nnodes $n l_try.lsf; done
```


Parse results:
```
python3 ../parse_results.py
```

Draw Figures:
```
python3 taco/scripts/draw.py
```
