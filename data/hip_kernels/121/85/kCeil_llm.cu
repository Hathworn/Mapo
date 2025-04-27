#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kCeil(float* mat, float* target, unsigned int len) {
    // Calculate the global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Check if index is within array bounds
    if (idx < len) {
        target[idx] = ceil(mat[idx]);
    }
}