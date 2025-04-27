#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setToOnes(float *data, int size)
{
    int index = threadIdx.x + blockIdx.x * blockDim.x; // 1D grid of 1D blocks
    int stride = blockDim.x * gridDim.x; // Calculate stride

    for (int i = index; i < size; i += stride) { // Iterate over data with stride
        data[i] = 1;
    }
}