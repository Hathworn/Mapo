#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplify index calculation to 1D
    if (i < n) {
        float bi = (b ? b[i] : 0); // Avoid conditional evaluation inside calculation
        c[i] = s[i] * a[i] + (1 - s[i]) * bi;
    }
}