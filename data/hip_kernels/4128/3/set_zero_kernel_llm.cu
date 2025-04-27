#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_zero_kernel(float *src, int size)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop for better utilization
    for (; i < size; i += blockDim.x * gridDim.x)
    {
        src[i] = 0;
    }
}