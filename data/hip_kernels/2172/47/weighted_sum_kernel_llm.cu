#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplify index calculation
    int gridStride = gridDim.x * blockDim.x;        // Define grid stride
    for (; i < n; i += gridStride) {                // Use stride loop for full grid utilization
        float b_val = (b != nullptr) ? b[i] : 0.0f; // Pre-compute b[i] value or zero
        c[i] = s[i] * a[i] + (1.0f - s[i]) * b_val; // Calculate c[i]
    }
}