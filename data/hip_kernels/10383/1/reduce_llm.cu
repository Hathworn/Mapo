#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int* s) {
    // Each thread loads its data into shared memory
    unsigned int tid = threadIdx.x;
    s[tid] = p;
    __syncthreads(); // Ensure all writes to shared are visible to all threads

    // Perform warp-level reduction within shared memory
    if (tid < 16) s[tid] += s[tid + 16];
    __syncthreads();
    if (tid < 8) s[tid] += s[tid + 8];
    __syncthreads();
    if (tid < 4) s[tid] += s[tid + 4];
    __syncthreads();
    if (tid < 2) s[tid] += s[tid + 2];
    __syncthreads();
    if (tid == 0) s[0] += s[1]; // Final sum at s[0]

    return s[0]; // Return the reduced result
}

__global__ void reduce(unsigned int* d_out_shared, const unsigned int* d_in) {
    extern __shared__ unsigned int s[];
    int t = threadIdx.x;
    int p = d_in[t];
    unsigned int sr = shared_reduce(p, s);
    if (t == 0) {
        *d_out_shared = sr;
    }
}