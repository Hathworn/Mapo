#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLessThan(float* mat1, float* mat2, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) {  // Ensure index is within bounds
        target[idx] = mat1[idx] < mat2[idx];
    }
}