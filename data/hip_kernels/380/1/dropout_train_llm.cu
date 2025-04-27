#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dropout_train(float* data, float* outputPtr, int size, float probability)
{
    // Calculate thread index
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Use stride loop optimization
    for (int i = index; i < size; i += stride)
    {
        if (outputPtr[i] < probability)
        {
            data[i] = 0;
        }
    }
}