#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    // Use a single variable for frequent calculations
    float B1t = pow(B1, t);
    float B2t = pow(B2, t);
    float rate_adj = rate * sqrt(1.f - B2t) / (1.f - B1t);

    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < N) { // Change to '<' for better loop structure
        float sqrt_v = sqrt(v[index]) + eps;
        x[index] -= rate_adj * m[index] / sqrt_v;
    }
}