#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iota(int const size, int *data, int const value)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;  // Added stride for processing larger data
    for (int i = idx; i < size; i += stride)  // Loop with stride to cover all elements
    {
        data[i] = i + value;  // Perform the update
    }
}