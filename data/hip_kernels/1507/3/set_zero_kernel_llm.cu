#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_zero_kernel(float *src, int size)
{
    // Calculate the global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use stride to allow more threads to participate
    int stride = gridDim.x * blockDim.x;

    // Use a loop with stride to ensure all elements are set to zero
    for (; i < size; i += stride)
    {
        src[i] = 0;
    }
}