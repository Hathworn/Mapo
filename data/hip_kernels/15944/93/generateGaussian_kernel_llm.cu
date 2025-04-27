#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generateGaussian_kernel(float* og, float delta, int radius)
{
    // Calculate once and reuse for efficiency
    float varFactor = 1.0f / (2 * delta * delta);
    
    // Use blockIdx.x to compute global index for flexibility with larger arrays
    int x = threadIdx.x - radius;
    og[threadIdx.x] = __expf(-(x * x) * varFactor);
}