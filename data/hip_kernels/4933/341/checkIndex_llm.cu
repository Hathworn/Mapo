#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void checkIndex(void)
{
    // Using a single printf call for improved efficiency
    printf("tIdx: (%d, %d, %d), bIdx: (%d, %d, %d), bDim: (%d, %d, %d), gDim: (%d, %d, %d)\n",
           threadIdx.x, threadIdx.y, threadIdx.z, blockIdx.x, blockIdx.y, blockIdx.z,
           blockDim.x, blockDim.y, blockDim.z, gridDim.x, gridDim.y, gridDim.z);
}