#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuArraysSetConstant_kernel(float *__restrict__ image, const int size, const float value)
{
    // Calculate global index
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    // Use grid-stride loop to cover larger arrays
    for (; idx < size; idx += blockDim.x * gridDim.x)
    {
        image[idx] = value;
    }
}