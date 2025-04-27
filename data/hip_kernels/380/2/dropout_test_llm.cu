#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dropout_test(float* data, int size, float probability)
{
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Optimize using strided loop and eliminate redundant multiplication
    for(int i = index; i < size; i += stride)
    {
        data[i] *= probability; // Direct in-place update
    }
}