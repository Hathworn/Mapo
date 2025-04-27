#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;

    // Precompute values outside loop
    float B1_t = 1.f - powf(B1, t);
    float B2_t = 1.f - powf(B2, t);

    // Use local variables for repeated calculations
    float m_val = m[index];
    float v_val = v[index];

    float mhat = m_val / B1_t;
    float vhat = v_val / B2_t;

    x[index] = x[index] + rate * mhat / (sqrtf(vhat) + eps);
}