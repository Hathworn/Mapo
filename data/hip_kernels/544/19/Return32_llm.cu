#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Return32( int *sum, int *out, const int *pIn )
{
    extern __shared__ int s[];

    // Load input into shared memory
    int idx = threadIdx.x;
    s[idx] = pIn[idx];
    __syncthreads();

    // Use shared memory for atomic operations
    atomicAdd(&s[idx], *sum); // Assuming a single accumulation target, using *sum
    __syncthreads();

    // Write results back to output
    out[idx] = s[idx];
}