#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if (index >= N) return;

    // Precompute powf(B1, t) and powf(B2, t) as they are the same for each thread
    float one_minus_pow_B1_t = 1.f - powf(B1, t);
    float one_minus_pow_B2_t = 1.f - powf(B2, t);
    float sqrt_eps = eps; // Precompute eps constant addition outside the loop

    // Leverage reuse of powf computation
    float mhat = m[index] / one_minus_pow_B1_t;
    float vhat = v[index] / one_minus_pow_B2_t;

    // Save computation by reusing variables
    x[index] = x[index] + rate * mhat / (sqrtf(vhat) + sqrt_eps);
}