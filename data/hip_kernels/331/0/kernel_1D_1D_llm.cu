#include "hip/hip_runtime.h"
#include "includes.h"

//device functions
__device__ int getGlobalIdx_1D_1D()
{
    return blockIdx.x * blockDim.x + threadIdx.x;
}

__global__ void kernel_1D_1D()
{
    int globalId = getGlobalIdx_1D_1D(); // Compute global ID only once to improve performance
    printf("Local thread ID: %i   Global thread ID: %i\n", threadIdx.x, globalId);
}