#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaUpdateFiringRate_kernel(int * firingRate, int * totalFiringRatePartial, unsigned int inputsDimX, unsigned int inputsDimY, unsigned int inputsDimZ)
{
    const unsigned int inputSize = inputsDimZ * inputsDimX * inputsDimY;
    const unsigned int batchInputOffset = blockIdx.z * inputSize;
    const unsigned int partialIdx = blockIdx.x * blockDim.x + threadIdx.x;

    extern __shared__ unsigned int partialSum[];

    // Initialize partial sum with 0, then add firingRate if within bounds
    partialSum[threadIdx.x] = (partialIdx < inputSize) ? firingRate[partialIdx + batchInputOffset] : 0;
    __syncthreads();

    // Optimized reduction using shared memory
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            partialSum[threadIdx.x] += partialSum[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Write the result of block-level reduction to global memory
    if (threadIdx.x == 0) {
        totalFiringRatePartial[blockIdx.x + gridDim.x * blockIdx.z] = partialSum[0];
    }
}