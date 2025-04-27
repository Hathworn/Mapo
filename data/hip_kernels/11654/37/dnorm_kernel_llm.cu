```c
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double dnorm(float x, float mu, float sigma)
{
    float std = (x - mu) / sigma;
    float e = exp(-0.5f * std * std);
    return e / (sigma * sqrtf(2.0f * 3.141592653589793f));
}

__global__ void dnorm_kernel(float *vals, int N, float mu, float sigma)
{
    // Calculate global index directly
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < N) {
        // Inline the calculation, reducing function call overhead
        float std = (vals[idx] - mu) / sigma;
        float e = exp(-0.5f * std * std);
        vals[idx] = e / (sigma * sqrtf(2.0f * 3.141592653589793f));
    }
}