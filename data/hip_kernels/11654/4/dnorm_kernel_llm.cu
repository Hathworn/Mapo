#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double dnorm(float x, float mu, float sigma)
{
    float std = (x - mu)/sigma;
    float e = exp( - 0.5 * std * std);
    return (e / ( sigma * sqrt(2 * 3.141592653589793)));
}

__global__ void dnorm_kernel(float *vals, int N, float mu, float sigma)
{
    // Calculate global thread index directly for improved readability.
    int idx = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.x * gridDim.x) + (threadIdx.y * blockDim.x * blockDim.y) + (threadIdx.z * blockDim.x * blockDim.y * blockDim.z);

    if (idx < N) {
        float std = (vals[idx] - mu)/sigma;
        float e = exp( - 0.5 * std * std);
        vals[idx] = e / ( sigma * sqrt(2 * 3.141592653589793));
    }
}