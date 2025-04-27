#include "hip/hip_runtime.h"
#include "includes.h"
__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int *s) {
    unsigned int tid = threadIdx.x;  // Get the thread index
    s[tid] = p;                      // Store the element in shared memory
    __syncthreads();                 // Synchronize to ensure all loads are complete

    // Warp-level reduction
    if (tid < 16) s[tid] += s[tid + 16];
    if (tid < 8) s[tid] += s[tid + 8];
    if (tid < 4) s[tid] += s[tid + 4];
    if (tid < 2) s[tid] += s[tid + 2];
    if (tid == 0) s[0] += s[1];

    return s[0];  // Return the result stored in s[0]
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