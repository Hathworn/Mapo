#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_touch(uint64_t *x, const size_t size)
{
    // Calculate the stride for the entire grid
    const size_t stride = blockDim.x * gridDim.x;

    // Use a stride loop to ensure all elements are touched
    for (size_t i = blockIdx.x * blockDim.x + threadIdx.x; i < size; i += stride)
    {
        x[i] = 0; // Zero-initialize the array element
    }
}