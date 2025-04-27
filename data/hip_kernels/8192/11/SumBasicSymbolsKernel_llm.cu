#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SumBasicSymbolsKernel(float *symbolVectors, int symbolOneId, int symbolTwoId, float *result, int symbolSize)
{
    // Use more concise expression for computing 'threadId'
    int threadId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x; 

    // Use shared memory to reduce global memory access
    __shared__ float sharedData[blockDim.x];

    if(threadId < symbolSize)
    {
        int offsetOne = symbolOneId * symbolSize + threadId;
        int offsetTwo = symbolTwoId * symbolSize + threadId;
        sharedData[threadIdx.x] = symbolVectors[offsetOne] + symbolVectors[offsetTwo];
        __syncthreads(); // Ensure all threads have completed their operations

        // Write result back to global memory
        result[threadId] = sharedData[threadIdx.x];
    }
}