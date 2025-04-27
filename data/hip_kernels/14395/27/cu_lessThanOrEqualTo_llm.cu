#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cu_lessThanOrEqualTo(const float* __restrict__ src, float* __restrict__ dst, const float val, const int n) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Use loop unrolling for improved performance
    for (; tid < n; tid += stride * 4) {
        if (tid < n) {
            dst[tid] = (src[tid] <= val) ? 1.0f : 0.0f;
        }
        if (tid + stride < n) {
            dst[tid + stride] = (src[tid + stride] <= val) ? 1.0f : 0.0f;
        }
        if (tid + 2 * stride < n) {
            dst[tid + 2 * stride] = (src[tid + 2 * stride] <= val) ? 1.0f : 0.0f;
        }
        if (tid + 3 * stride < n) {
            dst[tid + 3 * stride] = (src[tid + 3 * stride] <= val) ? 1.0f : 0.0f;
        }
    }
}