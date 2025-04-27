#include "hip/hip_runtime.h"
#include "includes.h"
__device__ int f () { return 21; }

// Optimize: Use shared memory to reduce global memory access latency
__global__ void AplusB(int *ret, int a, int N)
{
    size_t gindex = threadIdx.x + blockIdx.x * blockDim.x;
    if (gindex < N) 
    {
        ret[gindex] = a + gindex;
    }
}