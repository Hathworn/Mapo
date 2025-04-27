#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void checkIndex(void)
{
    // Calculate linear thread and block index for efficient memory access
    int linearThreadIdx = threadIdx.z * blockDim.y * blockDim.x + threadIdx.y * blockDim.x + threadIdx.x;
    int linearBlockIdx = blockIdx.z * gridDim.y * gridDim.x + blockIdx.y * gridDim.x + blockIdx.x;

    printf("linearThreadIdx:%d  linearBlockIdx:%d  blockDim:(%d, %d, %d) gridDim:(%d, %d, %d)\n",
           linearThreadIdx, linearBlockIdx,
           blockDim.x, blockDim.y, blockDim.z,
           gridDim.x, gridDim.y, gridDim.z);
}