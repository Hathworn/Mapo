#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cu_pow(const float* src, float* dst, const float power, const int n) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    // Loop unrolling for improved performance
    for (int idx = tid; idx < n; idx += stride) {
        dst[idx] = powf(src[idx], power);
        if (idx + stride < n) dst[idx + stride] = powf(src[idx + stride], power);
        else break;
    }
}