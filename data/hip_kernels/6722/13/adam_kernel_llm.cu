#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplify grid-stride loop
    if (index < N) { // Change condition to a loop
        // Pre-compute constants outside the loop
        float B1_t = 1.f - powf(B1, t);
        float B2_t = 1.f - powf(B2, t);
        float lr_t = rate * sqrtf(B2_t) / B1_t;

        // Update variable
        x[index] += lr_t * m[index] / (sqrtf(v[index]) + eps);
    }
}