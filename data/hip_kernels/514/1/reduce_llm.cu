#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int * s) {
    // Optimize reduction using warp-level primitives
    s[threadIdx.x] = p;
    __syncthreads();
    
    for (unsigned int stride = warpSize / 2; stride > 0; stride /= 2) {
        if (threadIdx.x < stride) {
            s[threadIdx.x] += s[threadIdx.x + stride];
        }
        __syncthreads(); // Ensure all threads have updated s before next iteration
    }
    
    return s[0]; // The reduced sum stored in s[0]
}

__global__ void reduce(unsigned int * d_out_shared, const unsigned int * d_in) {
    extern __shared__ unsigned int s[];
    int t = threadIdx.x;
    unsigned int p = d_in[t];
    unsigned int sr = shared_reduce(p, s);
    
    if (t == 0) {
        *d_out_shared = sr; // Store the result only from thread 0
    }
}