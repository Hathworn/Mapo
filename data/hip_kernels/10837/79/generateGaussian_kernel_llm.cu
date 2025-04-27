#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generateGaussian_kernel(float* __restrict__ og, float delta, int radius)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x - radius; // Use global indexing to reduce bank conflicts
    float normalization = 1.0f / (2 * delta * delta); // Pre-compute constant expression outside the loop
    og[threadIdx.x] = __expf(-((float)(x * x)) * normalization); // Reuse pre-computed value, cast x*x to float
}