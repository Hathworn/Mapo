#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t) {
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation for 1D grid
    if (index >= N) return;

    // Pre-compute common terms outside of index-based computations
    float B1_pow_t = powf(B1, t);
    float B2_pow_t = powf(B2, t);

    // Use these precomputed variables downstream for efficiency
    float mhat = m[index] / (1.f - B1_pow_t);
    float vhat = v[index] / (1.f - B2_pow_t);

    x[index] = x[index] + rate * mhat / (sqrtf(vhat) + eps);
}