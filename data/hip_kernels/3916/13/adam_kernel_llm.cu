```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    // Calculate linear global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;

    // Precompute (1 - powf(B1, t)) and (1 - powf(B2, t)) for performance improvement
    float invB1t = 1.f - powf(B1, t);
    float invB2t = 1.f - powf(B2, t);

    // Use the precomputed values
    float mhat = m[index] / invB1t;
    float vhat = v[index] / invB2t;

    // Optimize the update step
    x[index] += rate * mhat / (sqrtf(vhat) + eps);
}