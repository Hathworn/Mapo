#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLessThan(float* mat1, float* mat2, float* target, unsigned int len) {
    // Calculate the index based on block and thread indices
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Optimize the loop by removing unnecessary index calculations
    if (idx < len) {
        target[idx] = mat1[idx] < mat2[idx];
    }
}