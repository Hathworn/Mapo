#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaUpdateMostActive_kernel(unsigned int * exampleFiringRate, unsigned int * mostActiveId, unsigned int inputsDimX, unsigned int inputsDimY, unsigned int inputsDimZ)
{
    const unsigned int inputSize = inputsDimZ * inputsDimX * inputsDimY;
    const unsigned int batchInputOffset = blockIdx.z * inputSize;

    extern __shared__ unsigned int partialActiveIdx[];

    unsigned int maxIdx = threadIdx.x;
    unsigned int maxVal = 0;

    // Initialize shared memory and determine max index and value for each thread
    if (threadIdx.x < inputSize) {
        maxVal = exampleFiringRate[threadIdx.x + batchInputOffset];
        for (unsigned int i = threadIdx.x + blockDim.x; i < inputSize; i += blockDim.x) {
            unsigned int val = exampleFiringRate[i + batchInputOffset];
            if (val > maxVal) {
                maxVal = val;
                maxIdx = i;
            }
        }
    }
    partialActiveIdx[threadIdx.x] = maxIdx;

    __syncthreads();

    // Reduction to find the maximum firing rate index
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            unsigned int idx = partialActiveIdx[threadIdx.x + offset];
            if (exampleFiringRate[idx + batchInputOffset] > exampleFiringRate[partialActiveIdx[threadIdx.x] + batchInputOffset]) {
                partialActiveIdx[threadIdx.x] = idx;
            }
        }
        __syncthreads();
    }

    if (threadIdx.x == 0) {
        mostActiveId[blockIdx.z] = partialActiveIdx[0];
    }
}