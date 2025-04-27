#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel_optimized(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if (index >= N) return;

    // Pre-calculate common expressions outside memory access
    float one_minus_B1_pow_t = 1.f - powf(B1, t);
    float one_minus_B2_pow_t = 1.f - powf(B2, t);

    // Cache intermediate results to improve performance
    float m_i = m[index];
    float v_i = v[index];

    float mhat = m_i / one_minus_B1_pow_t;
    float vhat = v_i / one_minus_B2_pow_t;

    x[index] += rate * mhat / (sqrtf(vhat) + eps); // Combine assignment with calculation
}