#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSquashRelu(float* mat, float* target, unsigned int len, float lambda) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) { // Check if idx is within array bounds
        target[idx] = 2 / (1 + __expf(-lambda * mat[idx])) - 1; // Compute target using ReLU formula
    }
}