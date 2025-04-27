#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    if (i < n) {
        // Use conditional operator to simplify calculation
        float b_val = b ? b[i] : 0.0f;
        c[i] = s[i] * a[i] + (1.0f - s[i]) * b_val;
    }
}