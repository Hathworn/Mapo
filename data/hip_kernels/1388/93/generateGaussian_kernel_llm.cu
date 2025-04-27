#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void generateGaussian_kernel(float* og, float delta, int radius)
{
    int idx = threadIdx.x; // Cache threadIdx.x
    int x = idx - radius;
    float delta2 = 2 * delta * delta; // Precompute 2 * delta^2
    og[idx] = __expf(-(x * x) / delta2); // Use precomputed delta2
}