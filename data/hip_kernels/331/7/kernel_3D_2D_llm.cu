#include "hip/hip_runtime.h"
#include "includes.h"

//device functions
__device__ int getGlobalIdx_3D_2D()
{
    int blockId = (blockIdx.z * gridDim.y + blockIdx.y) * gridDim.x + blockIdx.x;
    int threadId = blockId * (blockDim.y * blockDim.x) + threadIdx.y * blockDim.x + threadIdx.x;
    return threadId;
}

__global__ void kernel_3D_2D()
{
    // Efficient global thread ID calculation with reduced arithmetic operations
    int globalThreadId = getGlobalIdx_3D_2D();
    printf("Local thread IDs: (%i,%i)   Global thread ID: %i\n", threadIdx.x, threadIdx.y, globalThreadId);
}