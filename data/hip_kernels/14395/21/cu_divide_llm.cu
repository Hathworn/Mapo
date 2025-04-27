#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cu_divide(const float* numerator, const float* denominator, float* dst, const int n) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    for (int i = tid; i < n; i += stride) {  // Use a for loop for better readability
        float denom_val = denominator[i];    // Load the denominator value once
        if (denom_val == 0.0f) {             // Use 0.0f for float comparisons
            dst[i] = 0.0f;
        } else {
            dst[i] = __fdividef(numerator[i], denom_val);
        }
    }
}