#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    // Calculate index within bounds
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;

    // Precompute terms outside loop to optimize
    float B2_pow_t = powf(B2, t);
    float B1_pow_t = powf(B1, t);
    float one_minus_B2_pow_t = 1.F - B2_pow_t;
    float one_minus_B1_pow_t = 1.F - B1_pow_t;
    float corrected_rate = rate * sqrtf(one_minus_B2_pow_t) / one_minus_B1_pow_t;

    // Update x
    x[index] = x[index] - (corrected_rate * m[index] / (sqrtf(v[index]) + eps));
}