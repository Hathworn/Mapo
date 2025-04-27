#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation
    if (index >= N) return;

    // Pre-compute powers of B1 and B2 outside of the kernel if possible for efficiency
    float m_scaling = 1.f - powf(B1, t);
    float v_scaling = 1.f - powf(B2, t);

    float mhat = m[index] / m_scaling;  
    float vhat = v[index] / v_scaling;

    x[index] = x[index] + rate * mhat / (sqrtf(vhat) + eps);
}