#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Optimize index calculation for 1D block
    if (index >= N) return;

    float B1_pow_t = pow(B1, t); // Precompute B1^t
    float B2_pow_t = pow(B2, t); // Precompute B2^t
    float sqrt_one_minus_B2_pow_t = sqrt(1.0f - B2_pow_t); // Precompute sqrt(1-B2^t)
    float one_minus_B1_pow_t = 1.0f - B1_pow_t;  // Precompute 1-B1^t
    float rate_scaled = rate * sqrt_one_minus_B2_pow_t / one_minus_B1_pow_t; // Combine scale factors
    
    x[index] -= rate_scaled * m[index] / (sqrt(v[index]) + eps); // Update x
}