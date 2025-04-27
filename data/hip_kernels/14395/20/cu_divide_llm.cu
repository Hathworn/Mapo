#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cu_divide(const float numerator, const float* __restrict__ denominator, float* __restrict__ dst, const int n){
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    
    // Use loop unrolling to optimize iterations
    for (int i = tid; i < n; i += stride * 4) {
        if (i < n) {
            dst[i] = (denominator[i] != 0) ? __fdividef(numerator, denominator[i]) : 0.0f;
        }
        if (i + stride < n) {
            dst[i + stride] = (denominator[i + stride] != 0) ? __fdividef(numerator, denominator[i + stride]) : 0.0f;
        }
        if (i + 2 * stride < n) {
            dst[i + 2 * stride] = (denominator[i + 2 * stride] != 0) ? __fdividef(numerator, denominator[i + 2 * stride]) : 0.0f;
        }
        if (i + 3 * stride < n) {
            dst[i + 3 * stride] = (denominator[i + 3 * stride] != 0) ? __fdividef(numerator, denominator[i + 3 * stride]) : 0.0f;
        }
    }
}