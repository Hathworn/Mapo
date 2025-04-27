#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if (index >= N) return;

    // Pre-compute powers outside of kernel to improve performance if possible
    float one_minus_B1_pow_t = 1.f - powf(B1, t);
    float one_minus_B2_pow_t = 1.f - powf(B2, t);

    float mhat = m[index] / one_minus_B1_pow_t; // Optimize division by constant
    float vhat = v[index] / one_minus_B2_pow_t; // Optimize division by constant

    x[index] += rate * mhat / (sqrtf(vhat) + eps); // Use compound assignment for clarity
}