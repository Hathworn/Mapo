#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaUpdateFiringRate_kernel(unsigned int *firingRate, unsigned int *totalFiringRatePartial, unsigned int inputsDimX, unsigned int inputsDimY, unsigned int inputsDimZ)
{
    const unsigned int inputSize = inputsDimZ * inputsDimX * inputsDimY;
    const unsigned int batchInputOffset = blockIdx.z * inputSize;
    const unsigned int blockOffset = blockIdx.x * blockDim.x;
    const unsigned int partialIdx = threadIdx.x + blockOffset;

    extern __shared__ unsigned int partialSum[];

    // Ensure partialSum is initialized with zero if partialIdx out of bounds
    if (partialIdx < inputSize) {
        partialSum[threadIdx.x] = firingRate[partialIdx + batchInputOffset];
    } else {
        partialSum[threadIdx.x] = 0;
    }

    __syncthreads();

    // Optimized reduction
    for (int offset = blockDim.x >> 1; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            partialSum[threadIdx.x] += partialSum[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Write final result to global memory
    if (threadIdx.x == 0) {
        totalFiringRatePartial[blockIdx.x + gridDim.x * blockIdx.z] = partialSum[0];
    }
}