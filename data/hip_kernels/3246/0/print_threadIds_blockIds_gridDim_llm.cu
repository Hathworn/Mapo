#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void print_threadIds_blockIds_gridDim()
{
    // Use a single printf to minimize I/O traffic and improve performance
    printf("threadIdx: (%d, %d, %d), blockIdx: (%d, %d, %d), gridDim: (%d, %d, %d) \n",
           threadIdx.x, threadIdx.y, threadIdx.z,
           blockIdx.x, blockIdx.y, blockIdx.z,
           gridDim.x, gridDim.y, gridDim.z);
}