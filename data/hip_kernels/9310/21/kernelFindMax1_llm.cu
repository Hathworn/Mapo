#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void kernelFindMax1(const int* dataArray, int arraySize, int* maxVal)
{
    // Use shared memory for intermediate max values
    extern __shared__ int sharedMax[];

    int threadIndex = threadIdx.x;
    int blockIndex = blockIdx.x;
    int blockSize = blockDim.x;
    int arrayIndex = blockSize * blockIndex + threadIndex;

    // Each thread initializes shared memory
    int localMax = (arrayIndex < arraySize) ? dataArray[arrayIndex] : INT_MIN;
    sharedMax[threadIndex] = localMax;
    __syncthreads();

    // Perform reduction to find block maximum
    for (int stride = blockSize / 2; stride > 0; stride /= 2) {
        if (threadIndex < stride) {
            sharedMax[threadIndex] = max(sharedMax[threadIndex], sharedMax[threadIndex + stride]);
        }
        __syncthreads();
    }

    // Use atomic operation to update global maximum from block maximums
    if (threadIndex == 0) {
        atomicMax(maxVal, sharedMax[0]);
    }
}