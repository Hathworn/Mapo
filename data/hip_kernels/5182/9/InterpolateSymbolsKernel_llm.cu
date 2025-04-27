#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void InterpolateSymbolsKernel(float *symbolVectors, int symbolOneId, int symbolTwoId, float weightOne, float weightTwo, float *resultSymbol, int symbolSize) {
    // Calculate the unique global thread ID directly
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure threadId is within bounds
    if (threadId < symbolSize) {
        int symbolOneCellId = symbolOneId * symbolSize + threadId;
        int symbolTwoCellId = symbolTwoId * symbolSize + threadId;

        // Perform interpolation
        resultSymbol[threadId] = weightOne * symbolVectors[symbolOneCellId] + weightTwo * symbolVectors[symbolTwoCellId];
    }
}