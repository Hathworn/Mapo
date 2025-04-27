```c
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int * s) {
    // Load the value into shared memory
    s[threadIdx.x] = p;
    __syncthreads();

    // Perform reduction in shared memory
    if (threadIdx.x < 16) s[threadIdx.x] += s[threadIdx.x + 16];
    __syncthreads();
    if (threadIdx.x < 8) s[threadIdx.x] += s[threadIdx.x + 8];
    __syncthreads();
    if (threadIdx.x < 4) s[threadIdx.x] += s[threadIdx.x + 4];
    __syncthreads();
    if (threadIdx.x < 2) s[threadIdx.x] += s[threadIdx.x + 2];
    __syncthreads();
    if (threadIdx.x < 1) s[threadIdx.x] += s[threadIdx.x + 1];
    __syncthreads();

    return s[0]; // Return result from s[0]
}

__global__ void reduce(unsigned int * d_out_shared, const unsigned int * d_in)
{
    extern __shared__ unsigned int s[];
    int t = threadIdx.x;
    int p = d_in[t];
    unsigned int sr = shared_reduce(p, s);
    if (t == 0)
    {
        *d_out_shared = sr;
    }
}