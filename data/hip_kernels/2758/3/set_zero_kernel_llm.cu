#include "hip/hip_runtime.h"
#include "includes.h"

// Use stride loop to ensure all threads in a block work efficiently
__global__ void set_zero_kernel(float *src, int size)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride
    for (; i < size; i += stride) // Loop with a stride
    {
        src[i] = 0;
    }
}