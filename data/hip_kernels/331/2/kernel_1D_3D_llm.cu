#include "hip/hip_runtime.h"
#include "includes.h"

//device functions
__device__ int getGlobalIdx_1D_3D()
{
    return blockIdx.x * blockDim.x * blockDim.y * blockDim.z + 
           threadIdx.z * blockDim.y * blockDim.x + 
           threadIdx.y * blockDim.x + 
           threadIdx.x;
}

__global__ void kernel_1D_3D()
{
    // Cache block dimensions
    int blockDimX = blockDim.x;
    int blockDimY = blockDim.y;
    int blockIdxX = blockIdx.x;

    // Pre-calculate reusable offsets
    int blockOffset = blockIdxX * blockDimX * blockDimY * blockDim.z;
    int threadOffsetZ = threadIdx.z * blockDimY * blockDimX;
    int threadOffsetY = threadIdx.y * blockDimX;

    // Calculate global index from pre-calculated offsets
    int globalIdx = blockOffset + threadOffsetZ + threadOffsetY + threadIdx.x;

    printf("Local thread IDs: (%i,%i,%i)   Global thread ID: %i\n", threadIdx.x, threadIdx.y, threadIdx.z, globalIdx);
}