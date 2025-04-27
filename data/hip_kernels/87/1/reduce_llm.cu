#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int * s) {
    // Store thread's input value in shared memory
    s[threadIdx.x] = p;
    __syncthreads(); // Ensure all threads have written to shared memory

    // Perform warp-level reduction using shared memory
    for (int stride = 16; stride > 0; stride /= 2) {
        if (threadIdx.x < stride) {
            s[threadIdx.x] += s[threadIdx.x + stride];
        }
        __syncthreads(); // Synchronize to ensure all additions are done
    }

    // Result is stored in s[0]
    return s[0];
}

__global__ void reduce(unsigned int * d_out_shared, const unsigned int * d_in) {
    extern __shared__ unsigned int s[];
    int t = threadIdx.x;
    int p = d_in[t];

    // Compute the sum in shared memory reduction
    unsigned int sr = shared_reduce(p, s);

    // Only the first thread writes the result to the output
    if (t == 0) {
        *d_out_shared = sr;
    }
}