#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kUpperBound(float* mat1, float* mat2, float* target, unsigned int len) {
    // Calculate global thread ID
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread index is within bounds before accessing data
    if (idx < len) {
        target[idx] = mat1[idx] > mat2[idx] ? mat2[idx] : mat1[idx];
    }
}