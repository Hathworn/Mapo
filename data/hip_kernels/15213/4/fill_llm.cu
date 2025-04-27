#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill(int * v, std::size_t size)
{
    // Cache commonly used values
    auto id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop for better utilization
    for (std::size_t i = id; i < size; i += blockDim.x * gridDim.x)
    {
        v[i] = i;
    }
}