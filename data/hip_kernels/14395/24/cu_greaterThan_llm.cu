#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void cu_greaterThan(const float* __restrict__ src, float* __restrict__ dst, const float val, const int n) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Unroll loop for improved memory access optimization
    for (int i = tid; i < n; i += stride) {
        dst[i] = (src[i] > val) ? 1.0f : 0.0f;
    }
}