#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < N) {
        // Precompute powers outside of the loop for efficiency
        float B1_pow_t = powf(B1, t);
        float B2_pow_t = powf(B2, t);
        
        // Use one division and precompute common terms
        float inv_one_minus_B1_pow_t = 1.f / (1.f - B1_pow_t);
        float inv_one_minus_B2_pow_t = 1.f / (1.f - B2_pow_t);

        // Use local variables for better performance
        float mhat = m[index] * inv_one_minus_B1_pow_t;
        float vhat = v[index] * inv_one_minus_B2_pow_t;
        
        // Update x using efficient computation
        x[index] += rate * mhat / (sqrtf(vhat) + eps);
    }
}