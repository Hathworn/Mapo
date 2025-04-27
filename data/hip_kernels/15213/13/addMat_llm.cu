#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addMat(float* mA_d, float* mB_d, std::size_t w, std::size_t h)
{
    // Calculate single index for linear access pattern
    auto index = blockDim.x * blockIdx.x + threadIdx.x + (blockDim.y * blockIdx.y + threadIdx.y) * w;

    // Ensure index is within bounds for 1D operation optimization
    if (index < w * h)
    {
        mA_d[index] += mB_d[index];
    }
}