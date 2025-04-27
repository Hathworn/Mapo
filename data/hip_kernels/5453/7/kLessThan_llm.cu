#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLessThan(float* mat1, float* mat2, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure idx does not exceed length of arrays
    if (idx < len) {
        target[idx] = mat1[idx] < mat2[idx];
    }
}