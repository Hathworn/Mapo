#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cu_greaterThanOrEqualTo(const float* __restrict__ src, float* __restrict__ dst, const float val, const int n) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Unroll loop for improved performance
    for (int i = tid; i < n; i += stride) {
        dst[i] = (src[i] >= val) ? 1.0f : 0.0f;  // Use ternary operator for conciseness
    }
}