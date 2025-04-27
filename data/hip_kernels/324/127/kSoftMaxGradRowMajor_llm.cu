#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSoftMaxGradRowMajor(float* mat, float* labels, float* target, unsigned int width, unsigned int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;
    
    // Optimization: Use shared memory for frequently accessed values
    extern __shared__ float sharedLabels[];
    
    unsigned int row = idx / width;
    
    if (threadIdx.x < height) {
        sharedLabels[threadIdx.x] = labels[threadIdx.x];
    }
    __syncthreads();
   
    for (unsigned int i = idx; i < width * height; i += numThreads) {
        unsigned int rowIndex = i / width;
        unsigned int colIndex = i % width;
        
        // Optimization: access shared memory for labels
        target[i] = mat[i] - ((int)sharedLabels[rowIndex] == colIndex ? 1 : 0);
    }
}