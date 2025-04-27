#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void increment(char* data, size_t length)
{
    // Use a for loop to allow each thread to handle multiple elements
    size_t global_index = threadIdx.x + blockIdx.x * blockDim.x;
    size_t stride = blockDim.x * gridDim.x;
    for (size_t i = global_index; i < length; i += stride)
    {
        data[i]++;
    }
}