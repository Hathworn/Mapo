#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void InterpolateVectorKernel(int r, int q, int f, int inputSize, float *referenceVector)
{
    int threadId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    // Optimize branching to improve performance; fewer memory accesses and logical operations.
    if (threadId < inputSize)
    {
        float valQ = referenceVector[q * inputSize + threadId];
        float valF = referenceVector[f * inputSize + threadId];
        referenceVector[r * inputSize + threadId] = 0.50f * (valQ + valF);
    }
}