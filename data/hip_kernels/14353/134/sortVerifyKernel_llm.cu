#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sortVerifyKernel(uint *d_DstKey, uint *d_DstVal, uint *d_SrcKey, uint *errNum)
{
    // Calculate global index
    uint idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory to reduce global memory access
    __shared__ uint sharedSrcKey[THREAD_SIZE];
    __shared__ uint sharedDstVal[THREAD_SIZE];

    // Load data from global to shared memory
    for (uint iterator = threadIdx.x; iterator < THREAD_SIZE; iterator += blockDim.x) {
        sharedDstVal[iterator] = d_DstVal[idx * THREAD_SIZE + iterator];
        sharedSrcKey[iterator] = d_SrcKey[sharedDstVal[iterator]];
    }
    __syncthreads();

    // Verify sorted key
    for (uint iterator = 0; iterator < THREAD_SIZE; iterator++) {
        if (sharedSrcKey[iterator] != d_DstKey[idx * THREAD_SIZE + iterator]) {
            atomicAdd(errNum, 1);
        }
    }
}