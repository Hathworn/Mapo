#include "hip/hip_runtime.h"
#include "includes.h"

//device functions
__device__ int getGlobalIdx_2D_1D()
{
    int blockId = blockIdx.y * gridDim.x + blockIdx.x;
    int threadId = blockId * blockDim.x + threadIdx.x;
    return threadId;
}

__global__ void kernel_2D_1D()
{
    // Use variables instead of inline function calls for efficiency
    int localThreadId = threadIdx.x;
    int globalThreadId = getGlobalIdx_2D_1D();
    printf("Local thread ID: %i   Global thread ID: %i\n", localThreadId, globalThreadId);
}