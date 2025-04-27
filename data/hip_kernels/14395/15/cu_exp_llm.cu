#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cu_exp(const float* src, float* dst, const int n) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    // Unroll the loop for better performance
    for (int i = tid; i < n; i += stride) {
        dst[i] = __expf(src[i]);
    }
}