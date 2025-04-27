#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vxy_kernel_large(const float* x, float* y, float* result, unsigned int len, unsigned int rowsz) {
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x + rowsz * blockIdx.y;
    
    // Unroll the loop for better performance
    if (idx < len) {
        result[idx] = x[idx] * y[idx];
        if (idx + blockDim.x < len) result[idx + blockDim.x] = x[idx + blockDim.x] * y[idx + blockDim.x];
    }
}