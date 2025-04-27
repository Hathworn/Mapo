#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    // Calculate global thread index efficiently
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < N)
    {
        // Precompute constants outside of the indexing
        float one_minus_B2t = 1.0f - __powf(B2, t);
        float one_minus_B1t = 1.0f - __powf(B1, t);

        // Update x[index] using precomputed constants for better performance
        float denom = sqrtf(v[index]) + eps;
        float update = (rate * sqrtf(one_minus_B2t) / one_minus_B1t) * (m[index] / denom);

        x[index] -= update;
    }
}