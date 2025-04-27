#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generateGaussian_kernel(float* og, float delta, int radius)
{
    // Cache the thread ID and pre-calculate repeated values
    int tid = threadIdx.x;
    float invTwoDeltaSquared = 1.0f / (2.0f * delta * delta);

    // Optimize x calculation to reduce operations
    int x = tid - radius;

    // Use fast math operation for exponent calculation
    og[tid] = __expf(-(x * x) * invTwoDeltaSquared);
}