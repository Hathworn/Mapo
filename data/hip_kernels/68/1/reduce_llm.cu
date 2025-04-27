#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int * s) {
    // Perform warp-wide reduction using efficient shuffle operations
    unsigned int laneId = threadIdx.x % warpSize;
    
    // Store the input to shared memory
    s[laneId] = p;
    __syncthreads();
    
    // Reduce within the warp using shared memory
    for (int offset = warpSize / 2; offset > 0; offset /= 2) {
        if (laneId < offset) {
            s[laneId] += s[laneId + offset];
        }
        __syncthreads();
    }
    
    // Return the reduction result
    return s[0];
}

__global__ void reduce(unsigned int * d_out_shared, const unsigned int * d_in)
{
    extern __shared__ unsigned int s[];
    int t = threadIdx.x;
    int p = d_in[t];
    unsigned int sr = shared_reduce(p, s);
    
    // Write reduction result to global memory only if threadIdx.x is 0
    if (t == 0) {
        *d_out_shared = sr;
    }
}