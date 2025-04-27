#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum(const float *input, float *output, int numElements) {
    // Get the index of the element to be processed by this thread
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Initialize shared memory for block-wide reduction
    extern __shared__ float sharedBuf[];
    
    // Load input data into shared memory, ensuring index is within bounds
    sharedBuf[threadIdx.x] = (index < numElements) ? input[index] : 0.0f;
    __syncthreads();
    
    // Perform reduction using shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            sharedBuf[threadIdx.x] += sharedBuf[threadIdx.x + stride];
        }
        __syncthreads();
    }
    
    // Write the block result to the output array
    if (threadIdx.x == 0) {
        atomicAdd(output, sharedBuf[0]);
    }
}