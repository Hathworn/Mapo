#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AbsoluteValueKernel(float* input, float* output, int size)
{
    // Calculate global thread ID in a more conventional manner
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Conditional check remains unchanged
    if (id < size)
    {
        output[id] = fabsf(input[id]);
    }
}