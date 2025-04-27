#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int * s) {
    // Initialize shared memory with input values
    s[threadIdx.x] = p;
    __syncthreads();

    // Perform warp-level reduction using binary tree method
    for (unsigned int stride = warpSize / 2; stride > 0; stride /= 2) {
        if (threadIdx.x < stride) {
            s[threadIdx.x] += s[threadIdx.x + stride];
        }
        __syncthreads();
    }
    
    // Store and return result from shared memory
    return s[0];
}

__global__ void reduce(unsigned int * d_out_shared, const unsigned int * d_in) {
    extern __shared__ unsigned int s[];
    int t = threadIdx.x;
    int p = d_in[t];

    // Call shared_reduce to compute sum within warp
    unsigned int sr = shared_reduce(p, s);

    // Only the first thread writes the result
    if (t == 0) {
        *d_out_shared = sr;
    }
}