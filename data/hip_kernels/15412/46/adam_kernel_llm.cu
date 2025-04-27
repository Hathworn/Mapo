#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Optimize index calculation for 1D grid

    if (index < N) { // Process elements in-bounds
        float B1_t = __powf(B1, t); // Avoid recomputation
        float B2_t = __powf(B2, t);

        float mhat = m[index] / (1.f - B1_t);
        float vhat = v[index] / (1.f - B2_t);

        x[index] += rate * mhat / (sqrtf(vhat) + eps); // Use compound assignment
    }
}