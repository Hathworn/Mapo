#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;

    // Pre-calculate constants outside loop
    float one_minus_powB1 = 1.f - powf(B1, t);
    float one_minus_powB2 = 1.f - powf(B2, t);

    // Use pre-calculated constants to optimize division operations
    float mhat = m[index] / one_minus_powB1;
    float vhat = v[index] / one_minus_powB2;

    // More efficient calculation of x
    x[index] += rate * mhat / (sqrtf(vhat) + eps);
}