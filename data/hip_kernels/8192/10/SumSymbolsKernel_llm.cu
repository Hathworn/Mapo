#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void SumSymbolsKernel( float *symbolOne, float *symbolTwo, float *result, int symbolSize )
{
    // Optimize thread index calculation using grid-stride loop to improve utilization
    for (int threadId = blockIdx.x * blockDim.x + threadIdx.x; 
         threadId < symbolSize; 
         threadId += blockDim.x * gridDim.x)
    {
        result[threadId] = symbolOne[threadId] + symbolTwo[threadId];
    }
}