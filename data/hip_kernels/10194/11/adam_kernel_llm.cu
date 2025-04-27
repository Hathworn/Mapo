#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    // Pre-compute shared values to reduce redundant calculations
    float one_minus_B1_t = 1.f - powf(B1, t);
    float one_minus_B2_t = 1.f - powf(B2, t);
    float sqrt_one_minus_B2_t = sqrtf(one_minus_B2_t);
    
    // Calculate flattened index within grid and block dimensions
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (index >= N) return;
    
    // Update x[index] with optimized calculation
    float m_val = m[index];
    float v_val = v[index];
    float sqrt_v_val_eps = sqrtf(v_val) + eps;
    
    x[index] -= (rate * sqrt_one_minus_B2_t / one_minus_B1_t) * m_val / sqrt_v_val_eps;
}