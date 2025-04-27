#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function with thread synchronization
__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation for 1D grid
    if (index < N) // Only proceed if index is within bounds
    {
        float mhat = m[index] / (1.f - __powf(B1, t)); // Use intrinsics for faster computation
        float vhat = v[index] / (1.f - __powf(B2, t)); 

        // Update x using computed mhat and vhat
        x[index] = x[index] + rate * mhat / (sqrtf(vhat) + eps);
    }
}