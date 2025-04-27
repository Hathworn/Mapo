#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int * s) {
    // Each thread puts its partial sum into shared memory
    s[threadIdx.x] = p;
    __syncthreads();

    // Reduce within warp
    if (threadIdx.x < 16) {
        s[threadIdx.x] += s[threadIdx.x + 16];
        s[threadIdx.x] += s[threadIdx.x + 8];
        s[threadIdx.x] += s[threadIdx.x + 4];
        s[threadIdx.x] += s[threadIdx.x + 2];
        s[threadIdx.x] += s[threadIdx.x + 1];
    }
    __syncthreads();

    // Return the result from the first thread
    return s[0];
}

__global__ void reduce(unsigned int * d_out_shared, const unsigned int * d_in) {
    extern __shared__ unsigned int s[];
    int t = threadIdx.x;
    unsigned int p = d_in[t];

    // Each thread calculates its partial sum and stores it in shared memory
    unsigned int sr = shared_reduce(p, s);

    // The first thread writes the result to the output
    if (t == 0) {
        *d_out_shared = sr;
    }
}