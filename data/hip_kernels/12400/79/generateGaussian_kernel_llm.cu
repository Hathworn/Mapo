#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generateGaussian_kernel(float* og, float delta, int radius)
{
    int x = threadIdx.x - radius;
    float delta_squared = 2 * delta * delta; // Precompute delta squared for reuse
    og[threadIdx.x] = __expf(-(x * x) / delta_squared); // Use the precomputed value
}