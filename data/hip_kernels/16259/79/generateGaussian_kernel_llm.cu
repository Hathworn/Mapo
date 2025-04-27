#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generateGaussian_kernel(float* og, float delta, int radius)
{
    int x = threadIdx.x - radius;
    float deltaSquared = 2.0f * delta * delta; // Precompute constant part
    int threadIdxX = threadIdx.x;
    // Use precomputed constant in __expf
    og[threadIdxX] = __expf(-(x * x) / deltaSquared);
}