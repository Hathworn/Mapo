#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_kernel(REAL* __restrict__ dst, REAL const value, std::size_t const count)
{
    // Calculate index using a combined declaration and computation
    std::size_t index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop for better handling of larger arrays
    for (; index < count; index += blockDim.x * gridDim.x)
    {
        dst[index] = value;
    }
}