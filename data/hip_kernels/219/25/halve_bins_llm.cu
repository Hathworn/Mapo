#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void halve_bins(int *bin, const int n)
{
    // Use a stride loop to handle more elements per thread efficiently
    for (unsigned int xIndex = blockDim.x * blockIdx.x + threadIdx.x; xIndex < n; xIndex += blockDim.x * gridDim.x)
    {
        bin[xIndex] /= 2;
    }
}