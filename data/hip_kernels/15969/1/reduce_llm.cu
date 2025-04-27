#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int *s) {
    // Store the current value to shared memory
    int t = threadIdx.x;
    s[t] = p;
    __syncthreads();

    // Perform warp-level reduction
    if (t < 16) s[t] += s[t + 16];
    __syncthreads();
    if (t < 8) s[t] += s[t + 8];
    __syncthreads();
    if (t < 4) s[t] += s[t + 4];
    __syncthreads();
    if (t < 2) s[t] += s[t + 2];
    __syncthreads();
    if (t < 1) s[t] += s[t + 1];
    __syncthreads();

    // Return the final reduction result
    return s[0];
}

__global__ void reduce(unsigned int *d_out_shared, const unsigned int *d_in) {
    extern __shared__ unsigned int s[];
    int t = threadIdx.x;
    int p = d_in[t];
    unsigned int sr = shared_reduce(p, s);
    if (t == 0) {
        *d_out_shared = sr;
    }
}