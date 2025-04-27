#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CropKernel(float min, float max, float* input, float* output, int size)
{
    // Optimize id calculation for better memory access pattern
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    if(id < size)
    {
        // Inline function call for efficiency
        output[id] = fmaxf(fminf(input[id], max), min);
    }
}