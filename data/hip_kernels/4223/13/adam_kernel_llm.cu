#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    // Calculate 1.f - powf(B1, t) and 1.f - powf(B2, t) outside the loop
    // for performance improvement
    float B1_t = 1.f - powf(B1, t);
    float B2_t = 1.f - powf(B2, t);

    int index = blockIdx.x * blockDim.x + threadIdx.x; // More efficient index calculation
    if (index >= N) return;

    float mhat = m[index] / B1_t;
    float vhat = v[index] / B2_t;

    x[index] += rate * mhat / (sqrtf(vhat) + eps); // Simplified update operation
}