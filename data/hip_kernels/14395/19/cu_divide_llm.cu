#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cu_divide(const float* numerator, float* dst, const float denominator, const int n) {
    // Calculate thread index
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use grid stride loop for efficient memory access
    for (int i = tid; i < n; i += blockDim.x * gridDim.x) {
        // Check denominator value and perform division
        dst[i] = (denominator == 0.0f) ? 0.0f : __fdividef(numerator[i], denominator);
    }
}