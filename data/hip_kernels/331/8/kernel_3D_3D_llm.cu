#include "hip/hip_runtime.h"
#include "includes.h"

// device functions
__device__ int getGlobalIdx_3D_3D()
{
    int blockId = blockIdx.x
                + blockIdx.y * gridDim.x
                + gridDim.x * gridDim.y * blockIdx.z;

    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.z * (blockDim.x * blockDim.y))
                 + (threadIdx.y * blockDim.x)
                 + threadIdx.x;

    return threadId;
}

__global__ void kernel_3D_3D()
{
    // Load global index once for efficiency
    int globalIdx = getGlobalIdx_3D_3D();
    // Print using local function call result
    printf("Local thread IDs: (%i,%i,%i)   Global thread ID: %i\n", threadIdx.x, threadIdx.y, threadIdx.z, globalIdx);
}