#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int * s) {
    unsigned int lane = threadIdx.x % 32; // Calculate lane index within a warp

    // Perform warp-level reduction using shuffle operations
    for (int offset = 16; offset > 0; offset /= 2) {
        p += __shfl_down_sync(0xffffffff, p, offset);
    }

    if (lane == 0) s[threadIdx.x / 32] = p; // Write reduced value of this warp to shared memory

    __syncthreads(); // Ensure all warps have written their results

    // Use the first warp to reduce values across warps
    if (threadIdx.x < 32) {
        unsigned int val = (threadIdx.x < (blockDim.x / 32)) ? s[threadIdx.x] : 0;
        for (int offset = 16; offset > 0; offset /= 2) {
            val += __shfl_down_sync(0xffffffff, val, offset);
        }
        if (threadIdx.x == 0) s[0] = val; // Store the final result in s[0]
    }

    __syncthreads(); // Ensure the final result is available for all threads

    return s[0]; // Return the reduced value
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