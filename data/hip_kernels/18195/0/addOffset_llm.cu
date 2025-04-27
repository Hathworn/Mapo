#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addOffset(int *dev_array, int length)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride for all threads
    for (int i = tid; i < length; i += stride) // Loop over elements using stride
    {
        dev_array[i] += OFFSET;
    }
}