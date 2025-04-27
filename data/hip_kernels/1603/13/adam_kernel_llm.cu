#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;  // Optimize index calculation
    if (index >= N) return;

    float B1_t_pow = powf(B1, t);  // Reduce redundant computations by reusing the power result
    float B2_t_pow = powf(B2, t);  // Reduce redundant computations by reusing the power result

    float mhat = m[index] / (1.f - B1_t_pow);
    float vhat = v[index] / (1.f - B2_t_pow);

    x[index] = x[index] + rate * mhat / (sqrtf(vhat) + eps);
}