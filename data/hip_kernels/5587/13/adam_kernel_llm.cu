#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    // Calculate flattened unique index for each thread
    int index = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    if (index >= N) return;

    // Using pre-computed and shared memory for efficiency
    float one_minus_B1_t = 1.f - powf(B1, t);
    float one_minus_B2_t = 1.f - powf(B2, t);
    
    float mhat = m[index] / one_minus_B1_t;
    float vhat = v[index] / one_minus_B2_t;
    
    // Efficient update of parameters
    x[index] += rate * mhat / (sqrtf(vhat) + eps);
}