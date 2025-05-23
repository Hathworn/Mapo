#include "hip/hip_runtime.h"
#include "includes.h"

//device functions
__device__ int getGlobalIdx_2D_3D()
{
    int blockId = blockIdx.x
                + blockIdx.y * gridDim.x;
                
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.z * (blockDim.x * blockDim.y))
                 + (threadIdx.y * blockDim.x)
                 + threadIdx.x;
                 
    return threadId;
}

__global__ void kernel_2D_3D()
{
    // Efficient computation, log global thread ID once
    int globalThreadId = getGlobalIdx_2D_3D();
    
    printf("Local thread IDs: (%i,%i,%i)   Global thread ID: %i\n", 
           threadIdx.x, threadIdx.y, threadIdx.z, globalThreadId);
}