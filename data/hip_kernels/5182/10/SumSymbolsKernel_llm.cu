#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SumSymbolsKernel(float *symbolOne, float *symbolTwo, float *result, int symbolSize)
{
    // Calculate global thread index using standard 1D grid-stride loop pattern
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = blockDim.x * gridDim.x;

    for (int i = threadId; i < symbolSize; i += gridSize) 
    {
        result[i] = symbolOne[i] + symbolTwo[i]; // Perform element-wise addition
    }
}