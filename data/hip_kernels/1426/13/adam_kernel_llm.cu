#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation, assuming 1D grid.
    if (index >= N) return;

    float B1_pow = powf(B1, t); // Precompute powf values outside loop.
    float B2_pow = powf(B2, t); 

    float mhat = m[index] / (1.f - B1_pow);
    float vhat = v[index] / (1.f - B2_pow);

    x[index] += rate * mhat / (sqrtf(vhat) + eps); // Simplify and use computation += syntax.
}