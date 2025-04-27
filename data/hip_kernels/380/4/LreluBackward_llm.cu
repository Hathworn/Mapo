#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LreluBackward(float* srcDiff, float* dstDiff, float* srcData, int data_size)
{
    int index = threadIdx.x + blockIdx.x * blockDim.x;

    // Utilize coalesced memory access by iterating over the same data size but with strided access
    for (int i = index; i < data_size; i += blockDim.x * gridDim.x)
    {
        dstDiff[i] = srcDiff[i] * ((srcData[i] > 0) + (srcData[i] <= 0) * 0.01);
    }
}