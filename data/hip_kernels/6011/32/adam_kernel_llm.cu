#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplify index calculation
    if (index >= N) return;

    float powB1 = 1.F - powf(B1, t); // Precompute repeated calculations
    float powB2 = 1.F - powf(B2, t);
    float sqrt_v = sqrtf(v[index]) + eps;
    
    x[index] -= (rate * sqrtf(powB2) / powB1) * (m[index] / sqrt_v); // Optimize operation order
}