#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CeilKernel(float* input, float* output, int size)
{
    // Compute the global thread ID more efficiently
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    if(id < size)
    {
        // Using intrinsic function for ceiling
        output[id] = hipCeilf(input[id]);
    }
}