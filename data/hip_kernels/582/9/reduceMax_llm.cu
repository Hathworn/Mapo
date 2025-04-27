#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceMax(const float* d_in, float* d_out) {
    extern __shared__ float sdata[];
    int abs_x = threadIdx.x + blockIdx.x * blockDim.x;
    int thread_x = threadIdx.x;

    // Load shared memory in bounds
    sdata[thread_x] = d_in[abs_x];
    __syncthreads();

    // Reduce block data to a single maximum value
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (thread_x < s) {
            sdata[thread_x] = max(sdata[thread_x], sdata[thread_x + s]);
        }
        __syncthreads();
    }

    // Return result at the 0th thread of every block
    if (thread_x == 0) {
        d_out[blockIdx.x] = sdata[0];
    }
}