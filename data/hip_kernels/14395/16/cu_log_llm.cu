#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cu_log(const float* __restrict__ src, float* __restrict__ dst, const int n) {
    // Optimize memory access by minimizing arithmetic operations
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    for (; tid < n; tid += stride) {
        dst[tid] = __logf(src[tid]);
    }
}