#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generateGaussian_kernel(float* og, float delta, int radius)
{
    // Calculate index for current thread
    int idx = threadIdx.x;

    // Compute x using the known relationship between thread and block dimensions
    int x = idx - radius;

    // Use precomputed constant to save computations
    float delta2_inv = 1.0f / (2 * delta * delta);
    
    // Optimize exponential calculation
    og[idx] = __expf(-(x * x) * delta2_inv);
}