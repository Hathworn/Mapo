#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum(const float *input, float *output, int numElements) {
    // Use threadIdx.x to process elements in parallel
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    float val = 0.f;
    
    // Ensure index is within bounds
    if (index < numElements) {
        for (int i = index; i < numElements; i += blockDim.x * gridDim.x) {
            val += input[i];
        }
    }
    
    // Use shared memory to reduce sum
    __shared__ float sharedData[256];  // Assumes blockDim.x <= 256
    sharedData[threadIdx.x] = val;
    __syncthreads();
    
    // Reduce using block threads
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            sharedData[threadIdx.x] += sharedData[threadIdx.x + s];
        }
        __syncthreads();
    }
    
    // Write result of block sum to global output
    if (threadIdx.x == 0) {
        atomicAdd(output, sharedData[0]);
    }
}