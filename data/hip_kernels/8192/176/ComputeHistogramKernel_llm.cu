#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeHistogramKernel(float *globalMemData, int *globalHist) {
    // Calculate unique global thread ID
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x;
    int localThreadId = threadIdx.x;
    
    // Declare shared memory for partial histogram
    extern __shared__ int partialHist[];

    // Initialize partial histogram in shared memory to zero
    if (localThreadId < D_BINS) {
        partialHist[localThreadId] = 0;
    }
    __syncthreads();

    // Ensure global thread id is within bounds
    if (globalThreadId < D_MEMORY_BLOCK_SIZE) {
        // Load data value from global memory
        float myLocalDataValue = globalMemData[globalThreadId];
        int binIdToWrite = 0;

        // Check if the local value is within limits
        if (myLocalDataValue >= D_MIN_VALUE && myLocalDataValue <= D_MAX_VALUE) {
            float biasedValue = myLocalDataValue - D_MIN_VALUE;
            binIdToWrite = (int)floorf(biasedValue / D_BIN_VALUE_WIDTH) + 1;
            if (myLocalDataValue == D_MAX_VALUE) {
                binIdToWrite = D_BINS - 2;
            }
        } else if (myLocalDataValue > D_MAX_VALUE) {
            binIdToWrite = D_BINS - 1;
        }
        
        // Update partial histogram in shared memory
        atomicAdd(&(partialHist[binIdToWrite]), 1);
    }
    __syncthreads();

    // Update global histogram with values from partial histogram
    if (localThreadId < D_BINS) {
        atomicAdd(&(globalHist[localThreadId]), partialHist[localThreadId]);
    }
}