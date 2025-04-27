```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSZeroInit_kernel(unsigned int size, float* data)
{
    // Calculate global index
    unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride to handle larger datasets efficiently
    unsigned int stride = blockDim.x * gridDim.x;

    // Efficient initialization using stride looping
    for (; index < size; index += stride)
    {
        data[index] = 0.0f;
    }
}