#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate global thread index using block and thread indices
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use more threads by adjusting block dimension if needed
    if (i < n) {
        // Perform the calculation directly using ternary for compact expression
        c[i] = s[i] * a[i] + (1 - s[i]) * ((b != NULL) ? b[i] : 0.0f);
    }
}