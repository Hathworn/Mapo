#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void totalWithThreadSyncAndSharedMem(float *input, float *output, int len) {
    // Use shared memory for reduction
    __shared__ float sdata[BLOCK_SIZE];
    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load input into shared memory and handle out of bounds
    if (i < len)
        sdata[tid] = input[i];
    else
        sdata[tid] = 0.0f;

    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int j = blockDim.x / 2; j > 0; j >>= 1) {
        if (tid < j) {
            sdata[tid] += sdata[tid + j];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) {
        output[blockIdx.x] = sdata[0];
    }
}