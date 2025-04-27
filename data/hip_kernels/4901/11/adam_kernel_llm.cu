#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread index is within bounds
    if (index < N) { 
        // Precompute constant values outside the loop
        float bias_correction1 = 1.0f - powf(B1, t);
        float bias_correction2 = 1.0f - powf(B2, t);
        float sqrt_bias_correction2 = sqrtf(bias_correction2);

        // Update the parameter using Adam update rule with precomputed values
        float m_hat = m[index] / bias_correction1;
        float v_hat = sqrtf(v[index]) + eps;
        float scaled_rate = rate * sqrt_bias_correction2 / v_hat;

        x[index] -= scaled_rate * m_hat;
    }
}