#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kUpperBound(float* mat1, float* mat2, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure only active threads do computations
    if (idx < len) {
        target[idx] = mat1[idx] > mat2[idx] ? mat2[idx] : mat1[idx];
    }
}