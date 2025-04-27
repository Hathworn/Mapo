#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate the 1D index for the thread
    int index = threadIdx.y * blockDim.x + threadIdx.x +
                (blockIdx.y * blockDim.y + blockIdx.x) * blockDim.x * blockDim.y;

    // Calculate total number of elements
    int totalElements = w * h;

    // Use 1D index to ensure threads work on unique positions
    if (index < totalElements)
    {
        image[index] = value;
    }
}