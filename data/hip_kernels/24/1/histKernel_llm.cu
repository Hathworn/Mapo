#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histKernel(char *inData, long size, unsigned int *histo)
{
    __shared__ unsigned int temp[BIN_COUNT][BIN_COUNT];
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int offset = blockDim.x * gridDim.x;

    // Initialize shared memory for current thread
    for (int i = 0; i < BIN_COUNT; ++i)
        temp[i][threadIdx.x] = 0;

    __syncthreads();

    // Accumulate local histogram in shared memory
    while(tid < size) {
        atomicAdd(&temp[(int)inData[tid]][threadIdx.x], 1);
        tid += offset;
    }

    __syncthreads();

    // Reduce local histograms to global memory
    for (int i = 0; i < BIN_COUNT; ++i)
        atomicAdd(&(histo[i]), temp[i][threadIdx.x]);
}