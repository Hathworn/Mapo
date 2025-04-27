#include "hip/hip_runtime.h"
#include "includes.h"

// __global__ function optimized with improved memory access
__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < N) {
        float B1_t = powf(B1, t);  // Precompute B1^t
        float B2_t = powf(B2, t);  // Precompute B2^t

        float mhat = m[index] / (1.f - B1_t);  // Use precomputed B1^t
        float vhat = v[index] / (1.f - B2_t);  // Use precomputed B2^t

        x[index] += rate * mhat / (sqrtf(vhat) + eps);  // Use += for direct update
    }
}