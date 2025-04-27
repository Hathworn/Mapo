#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generateGaussian_kernel(float* og, float delta, int radius)
{
    const int x = threadIdx.x - radius;
    const float inv_delta_squared = 1.0f / (2 * delta * delta); // Precompute inverse of delta squared
    og[threadIdx.x] = __expf(-x * x * inv_delta_squared); // Use precomputed value
}