#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (index >= N) return;

    // Precompute constants for optimization
    float B1_t = 1.f - powf(B1, t);
    float B2_t = 1.f - powf(B2, t);

    float mhat = m[index] / B1_t;
    float vhat = v[index] / B2_t;

    // Use compiler intrinsic for better performance
    x[index] = x[index] + rate * mhat / (__fsqrt_rn(vhat) + eps);
}