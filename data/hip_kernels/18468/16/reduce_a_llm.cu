#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduce_a(float *gdata, float *out) {
    __shared__ float sdata[BLOCK_SIZE];
    int tid = threadIdx.x;
    sdata[tid] = 0.0f;
    size_t idx = threadIdx.x + blockDim.x * blockIdx.x;

    // Unrolling loop to improve data loading
    while (idx < N) {
        sdata[tid] += gdata[idx];
        idx += gridDim.x * blockDim.x;
    }

    // Perform reduction in shared memory
    __syncthreads();
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();  // Ensure all threads are synchronized before next iteration
    }
    
    // Use atomic operation for final result update
    if (tid == 0) atomicAdd(out, sdata[0]);
}