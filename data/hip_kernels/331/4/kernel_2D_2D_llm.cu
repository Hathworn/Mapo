#include "hip/hip_runtime.h"
#include "includes.h"

//device functions
__device__ int getGlobalIdx_2D_2D()
{
    int blockId = blockIdx.x + blockIdx.y * gridDim.x;
    int threadId = blockId * (blockDim.x * blockDim.y) + (threadIdx.y * blockDim.x) + threadIdx.x;
    return threadId;
}

__global__ void kernel_2D_2D()
{
    // Calculate global thread ID only once
    int globalThreadId = getGlobalIdx_2D_2D();
    
    // Use the pre-calculated global thread ID
    printf("Local thread IDs: (%i,%i)   Global thread ID: %i\n", 
           threadIdx.x, threadIdx.y, globalThreadId);
}