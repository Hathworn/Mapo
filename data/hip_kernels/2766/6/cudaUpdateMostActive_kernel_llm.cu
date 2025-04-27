#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaUpdateMostActive_kernel(unsigned int * exampleIds, unsigned int * exampleFiringRate, unsigned int * mostActiveId, unsigned int inputsDimX, unsigned int inputsDimY, unsigned int inputsDimZ)
{
    const unsigned int inputSize = inputsDimZ * inputsDimX * inputsDimY;
    const unsigned int batchInputOffset = blockIdx.z * inputSize;
    const unsigned int blockOffset = blockIdx.x * blockDim.x;
    const unsigned int partialIdx = threadIdx.x + blockOffset;

    extern __shared__ unsigned int partialActiveIdx[];
    extern __shared__ unsigned int partialFiringRate[];

    // Initialize shared memory with firing rates
    if (partialIdx < inputSize) {
        partialActiveIdx[threadIdx.x] = exampleIds[partialIdx + batchInputOffset];
        partialFiringRate[threadIdx.x] = exampleFiringRate[partialActiveIdx[threadIdx.x]];
    } else {
        partialFiringRate[threadIdx.x] = 0;
        partialActiveIdx[threadIdx.x] = 0;
    }

    __syncthreads();

    // Reduction over neurons
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            if (partialFiringRate[threadIdx.x] < partialFiringRate[threadIdx.x + offset]) {
                partialFiringRate[threadIdx.x] = partialFiringRate[threadIdx.x + offset];
                partialActiveIdx[threadIdx.x] = partialActiveIdx[threadIdx.x + offset];
            }
        }
        __syncthreads();
    }

    if (threadIdx.x == 0) {
        mostActiveId[blockIdx.x + gridDim.x * blockIdx.z] = partialActiveIdx[0];
    }
}