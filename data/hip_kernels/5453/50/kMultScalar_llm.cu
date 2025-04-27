#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultScalar(float* mat, float alpha, float* dest, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if idx is within bounds
    if (idx < len) {
        // Perform computation directly with a single assignment
        dest[idx] = alpha * mat[idx];
    }
}