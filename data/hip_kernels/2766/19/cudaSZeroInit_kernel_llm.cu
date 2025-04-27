#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSZeroInit_kernel(unsigned int size, float* data)
{
    // Calculate a global index for each thread
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a single loop iteration without stride; better warp efficiency
    if (index < size)
    {
        data[index] = 0.0f;
    }
}