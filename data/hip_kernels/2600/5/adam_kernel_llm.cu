#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    // Calculate unique global index for each thread
    int index = blockIdx.x * blockDim.x + threadIdx.x; 
    if (index >= N) return;

    // Precompute constant terms outside of the per-element operations
    float correction1 = 1.0f - powf(B1, t);
    float correction2 = sqrtf(1.0f - powf(B2, t));
    
    // Optimal update calculation for x[i]
    float m_hat = m[index] / correction1;
    float v_hat = sqrtf(v[index]) / correction2;

    x[index] = x[index] - (rate * m_hat / (v_hat + eps));
}