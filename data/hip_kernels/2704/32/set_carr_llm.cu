#include "hip/hip_runtime.h"
#include "includes.h"

// To suppress the unused variable argument for ARM targets
#pragma diag_suppress 177

#ifndef NAN   // should be part of math.h
#define NAN (0.0/0.0)
#endif

#define ACCU_ARRTYPE double  // Type of the tempory arrays for reduce operations
#define IMUL(a, b) __mul24(a, b)

#ifndef CUIMAGE_REDUCE_THREADS
#define CUIMAGE_REDUCE_THREADS 512
#endif

#define NBLOCKS(N,blockSize) (N/blockSize+(N%blockSize==0?0:1))

#define NBLOCKSL(N,blockSize) 1

__global__ void set_carr(float br, float bi, float * c, size_t N)
{
    size_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Optimize boundary check
    if (idx < N)
    {
        size_t idc = idx * 2;
        c[idc] = br;
        c[idc + 1] = bi;
    }
}