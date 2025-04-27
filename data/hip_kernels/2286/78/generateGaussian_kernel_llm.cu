#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generateGaussian_kernel(float* og, float delta, int radius)
{
    int x = threadIdx.x - radius;
    float deltaSquared = 2 * delta * delta;  // Precompute constant term
    og[threadIdx.x] = __expf(-(x * x) / deltaSquared);  // Use precomputed term
}