#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void InterpolateSymbolsKernel(float *symbolVectors, int symbolOneId, int symbolTwoId, float weightOne, float weightTwo, float *resultSymbol, int symbolSize)
{
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate only necessary thread operations
    if (threadId < symbolSize)
    {
        int symbolOneCellId = symbolOneId * symbolSize + threadId;
        int symbolTwoCellId = symbolTwoId * symbolSize + threadId;

        resultSymbol[threadId] = weightOne * symbolVectors[symbolOneCellId] + weightTwo * symbolVectors[symbolTwoCellId];
    }
}