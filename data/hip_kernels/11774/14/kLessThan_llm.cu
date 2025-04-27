#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLessThan(float* mat1, float* mat2, float* target, unsigned int len) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Optimize by ensuring a clean boundary check within the loop
    if (idx < len) {
        target[idx] = mat1[idx] < mat2[idx];
    }
}