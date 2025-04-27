#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if (index >= N) return;

    float denom = 1.f - powf(B1, t); // Precompute denominator
    float sqrt_b2t = sqrtf(1.f - powf(B2, t)); // Precompute sqrt of 1 - B2^t
    float sqrt_v_eps = sqrtf(v[index]) + eps; // Precompute sqrt(v)+eps

    x[index] += (rate * sqrt_b2t / denom) * m[index] / sqrt_v_eps; // Simplified x[index] update
}