#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SumBasicSymbolsKernel(float *symbolVectors, int symbolOneId, int symbolTwoId, float *result, int symbolSize)
{
    int threadId = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread index calculation

    if (threadId < symbolSize)
    {
        // Vector addition for corresponding elements
        result[threadId] = symbolVectors[symbolOneId * symbolSize + threadId] + symbolVectors[symbolTwoId * symbolSize + threadId];
    }
}