#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void kernelCalcSum_AtomicOnly(const int* __restrict__ dataArray, int arraySize, int* sum)
{
    // Use shared memory to reduce atomic operations on global memory
    extern __shared__ int sharedData[];
    
    int localIndex = threadIdx.x;
    int globalIndex = blockDim.x * blockIdx.x + localIndex;

    // Load data into shared memory
    sharedData[localIndex] = (globalIndex < arraySize) ? dataArray[globalIndex] : 0;
    __syncthreads();

    // Parallel reduction in shared memory
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (localIndex < stride) {
            sharedData[localIndex] += sharedData[localIndex + stride];
        }
        __syncthreads();
    }

    // Atomic add the result of each block to the global sum
    if (localIndex == 0) {
        atomicAdd(sum, sharedData[0]);
    }
}