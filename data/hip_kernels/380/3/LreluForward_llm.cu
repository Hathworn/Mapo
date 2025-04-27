#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LreluForward(float* srcData, float* dstData, int data_size)
{
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    // Ensure each thread handles one element, removing unnecessary loop
    if(index < data_size)
    {
        dstData[index] = srcData[index] > 0 ? srcData[index] : srcData[index] * 0.01;
    }
}