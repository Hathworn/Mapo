#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMinimum(float* mat1, float* mat2, float* target, unsigned int len) {
    // Calculate the global index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the index is within bounds
    if (idx < len) {
        target[idx] = fminf(mat1[idx], mat2[idx]);
    }
}