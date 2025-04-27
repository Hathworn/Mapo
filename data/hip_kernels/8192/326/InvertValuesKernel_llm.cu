#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void InvertValuesKernel(float *input, float* outputs, int size)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified ID computation

    if(id < size)
    {
        outputs[id] = 1.00f - input[id];
    }
}