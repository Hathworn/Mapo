#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;
    
    // Precompute reused variables outside of the per-thread scope
    float sqrt_1_minus_B2_t = sqrtf(1.F - powf(B2, t));
    float inv_1_minus_B1_t = 1.F / (1.F - powf(B1, t));

    // Update position with precomputed variables
    x[index] = x[index] - (rate * sqrt_1_minus_B2_t * inv_1_minus_B1_t * m[index] / (sqrtf(v[index]) + eps));
}