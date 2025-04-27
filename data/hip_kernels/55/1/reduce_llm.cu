#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int *s) {
    // Storing the input value to shared memory
    int idx = threadIdx.x;
    s[idx] = p;

    // Ensure all writes to shared memory are complete
    __syncthreads();

    // Warp-wide reduction using arithmetic operations
    if (idx < 16) s[idx] += s[idx + 16]; // Reduce within half-warp
    __syncthreads();
    if (idx < 8) s[idx] += s[idx + 8];
    __syncthreads();
    if (idx < 4) s[idx] += s[idx + 4];
    __syncthreads();
    if (idx < 2) s[idx] += s[idx + 2];
    __syncthreads();
    if (idx == 0) s[0] += s[1]; // Final reduction

    // Return the result stored in the first element of the shared memory
    return s[0];
}

__global__ void reduce(unsigned int *d_out_shared, const unsigned int *d_in) {
    extern __shared__ unsigned int s[];
    int t = threadIdx.x;
    int p = d_in[t];

    // Calling shared reduce function
    unsigned int sr = shared_reduce(p, s);

    // Write the result from the first thread of the block to global memory
    if (t == 0) {
        *d_out_shared = sr;
    }
}