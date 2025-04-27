#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int * s) {
    // Each thread loads its data into shared memory
    int lane = threadIdx.x % warpSize;
    s[lane] = p;

    // Warp reduction using shuffle down and a single shared memory location for results
    #pragma unroll // Unroll loop for better performance
    for (int i = warpSize/2; i > 0; i /= 2) {
        p += __shfl_down(p, i);
    }

    // Store the result of warp reduction in shared memory
    if (lane == 0) s[0] = p;

    // Synchronize to ensure the result is stored
    __syncthreads(); 
    
    return s[0];
}

__global__ void reduce(unsigned int * d_out_shared, const unsigned int * d_in) {
    extern __shared__ unsigned int s[];
    int t = threadIdx.x;
    int p = d_in[t];
    unsigned int sr = shared_reduce(p, s);
    if (t == 0) {
        *d_out_shared = sr;
    }
}