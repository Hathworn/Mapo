#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLowerBoundScalar(float* mat, float val, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;  // Reduce repetitive calculation
    
    // Use stride variable for loop increment
    for (unsigned int i = idx; i < len; i += stride) {
        target[i] = mat[i] < val ? val : mat[i];
    }
}