#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cu_relu(const float* src, float* dst, int n) {
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Unroll loop for efficiency
    for (int i = tid; i < n; i += stride) {
        // Use ternary operator for simplicity
        dst[i] = src[i] > 0.0f ? src[i] : 0.0f;
    }
}