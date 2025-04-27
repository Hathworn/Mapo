#include "hip/hip_runtime.h"
#include "includes.h"

//device functions
__device__ int getGlobalIdx_3D_1D()
{
    int blockId = blockIdx.x
                + blockIdx.y * gridDim.x
                + blockIdx.z * gridDim.x * gridDim.y;

    int threadId = blockId * blockDim.x + threadIdx.x;

    return threadId;
}

__global__ void kernel_3D_1D()
{
    // Launch fewer printf calls by using a single thread per block
    if (threadIdx.x == 0) {
        printf("Block ID: [%i, %i, %i]   First Global thread ID: %i\n", 
                blockIdx.x, blockIdx.y, blockIdx.z, getGlobalIdx_3D_1D());
    }
}