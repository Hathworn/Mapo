#include "hip/hip_runtime.h"
#include "includes.h"

// To suppress the unused variable argument for ARM targets
#pragma diag_suppress 177

#ifndef NAN   // should be part of math.h
#define NAN (0.0/0.0)
#endif

#define ACCU_ARRTYPE double  // Type of the tempory arrays for reduce operations
#define IMUL(a, b) __mul24(a, b)

#ifndef CUIMAGE_REDUCE_THREADS  // this can be defined at compile time via the flag NVCCFLAG='-D CUIMAGE_REDUCE_THREADS=512'
#define CUIMAGE_REDUCE_THREADS 512
#endif

#define NBLOCKS(N,blockSize) (N/blockSize+(N%blockSize==0?0:1))
#define NBLOCKSL(N,blockSize) 1

__global__ void set_arr(float b, float * c, size_t N)
{
    size_t idx = blockIdx.x * blockDim.x + threadIdx.x; // Simplified calculation of linear thread index
    if (idx < N) { // Reduce the branch divergence by minimizing operations inside the conditional
        c[idx] = b; // Directly assign the value to array position
    }
}