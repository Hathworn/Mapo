#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Return32( int *sum, int *out, const int *pIn )
{
    // Use shared memory to cache input values
    extern __shared__ int s[];
    int tid = threadIdx.x;
    s[tid] = pIn[tid];
    __syncthreads();

    // Atomic operation only needed if modifying shared data amongst threads
    atomicAdd(&s[tid], pIn[tid]);
    __syncthreads();

    // Directly store the result in output array
    out[tid] = s[tid];
}