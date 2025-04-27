#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if (index >= N) return;

    float m_hat = m[index] / (1.f - __powf(B1, t)); // Use fast math functions
    float v_hat = v[index] / (1.f - __powf(B2, t));

    x[index] += rate * m_hat / (sqrtf(v_hat) + eps); // Simplified update expression
}