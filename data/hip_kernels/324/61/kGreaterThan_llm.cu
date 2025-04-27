#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kGreaterThan(float* mat1, float* mat2, float* target, unsigned int len) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Optimize by ensuring thread index is within bounds
    if (idx < len) {
        target[idx] = mat1[idx] > mat2[idx];
    }
}