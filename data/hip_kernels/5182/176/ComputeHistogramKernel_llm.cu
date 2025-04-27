#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeHistogramKernel(float *globalMemData, int *globalHist) {
    int globalThreadId = blockDim.x * blockIdx.y * gridDim.x  // rows preceding current row in grid
                       + blockDim.x * blockIdx.x               // blocks preceding current block
                       + threadIdx.x;
    int localThreadId = threadIdx.x;
    extern __shared__ int partialHist[];

    // Initialize shared memory only if within D_BINS
    if (localThreadId < D_BINS) {
        partialHist[localThreadId] = 0;
    }
    __syncthreads();

    // Operate only if within bounds
    if (globalThreadId < D_MEMORY_BLOCK_SIZE) {
        float myLocalDataValue = globalMemData[globalThreadId];
        int binIdToWrite = 0 + (D_BINS - 1) * (myLocalDataValue > D_MAX_VALUE);

        // Check if within valid range
        if (myLocalDataValue >= D_MIN_VALUE && myLocalDataValue <= D_MAX_VALUE) {
            // Calculate bin index
            float biasedValue = myLocalDataValue - D_MIN_VALUE;
            binIdToWrite = (int)floor((double)(biasedValue / D_BIN_VALUE_WIDTH)) + 1;

            // Special case for maximum value
            if (myLocalDataValue == D_MAX_VALUE) {
                binIdToWrite = D_BINS - 2;
            }
        }
        // Update local histogram with atomic operation
        atomicAdd(&(partialHist[binIdToWrite]), 1);
        __syncthreads();

        // Copy local histogram to global histogram
        if (localThreadId < D_BINS) {
            atomicAdd(&(globalHist[localThreadId]), partialHist[localThreadId]);
        }
    }
}