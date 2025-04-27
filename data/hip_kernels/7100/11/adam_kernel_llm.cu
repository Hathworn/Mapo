#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    // Calculate unique thread index
    int index = (blockIdx.x * blockDim.x) + threadIdx.x;
    if (index >= N) return;

    // Precompute terms used in multiple calculations
    float B1_t_pow = powf(B1, t);
    float B2_t_pow = powf(B2, t);
    float rate_adj = rate * sqrtf(1.0f - B2_t_pow) / (1.0f - B1_t_pow);

    // Optimize division by using reciprocal
    x[index] -= rate_adj * m[index] / (sqrtf(v[index]) + eps);
}