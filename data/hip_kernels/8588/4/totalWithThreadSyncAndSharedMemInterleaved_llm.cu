```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void totalWithThreadSyncAndSharedMemInterleaved(float *input, float *output, int len) {
    // Utilize shared memory for block-wide reduction
    __shared__ float sdata[BLOCK_SIZE];
    
    // Calculate global index
    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load input data into shared memory
    if (i < len)
        sdata[tid] = input[i];
    else
        sdata[tid] = 0.0;
    __syncthreads(); // Ensure all data is loaded before reduction begins
    
    // Perform reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads(); // Synchronize threads before next step
    }
    
    // Write result for this block to global memory
    if (tid == 0) {
        output[blockIdx.x] = sdata[0];
    }
}