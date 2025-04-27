#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplify index calculation
    if (index >= N) return;

    float B1_t = 1.f - powf(B1, t); // Precompute (1 - B1^t) for efficiency
    float B2_t = 1.f - powf(B2, t); // Precompute (1 - B2^t) for efficiency
    float mhat = m[index] / B1_t;
    float vhat = v[index] / B2_t;

    x[index] += rate * mhat / (sqrtf(vhat) + eps); // Use compound assignment for clarity
}