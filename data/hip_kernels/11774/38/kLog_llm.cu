#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLog(float* mat, float* target, unsigned int len, float tiny) {
    // Calculate global index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we don't go out of bounds
    if (idx < len) {
        target[idx] = __logf(mat[idx] + tiny);
    }
}