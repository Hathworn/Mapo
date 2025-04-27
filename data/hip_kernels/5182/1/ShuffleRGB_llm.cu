#include "hip/hip_runtime.h"
#include "includes.h"
//#define _SIZE_T_DEFINED

extern "C"
{
}

__global__ void ShuffleRGB(float* input, float* output, int size)
{
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    if (id < size)
    {
        // Calculate index using efficient integer math
        int sector = size / 3;
        int index = (id / 3) + (id % 3) * sector;
        output[index] = input[id];
    }
}