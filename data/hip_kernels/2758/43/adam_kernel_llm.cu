#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;  // Simplify index calculation

    if (index < N)  // Reverse logic for efficiency
    {
        // Pre-compute powers outside the loop for performance
        float invB1T = 1.f / (1.f - powf(B1, t)); 
        float invB2T = 1.f / (1.f - powf(B2, t));
        
        float mhat = m[index] * invB1T;  // Use multiplication instead of division
        float vhat = v[index] * invB2T;  // Use multiplication instead of division

        x[index] += rate * mhat / (sqrtf(vhat) + eps);  // Simplified updating of x[index]
    }
}