#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void check_index()
{
    // Use single printf call for clarity and performance
    printf("ThreadIdx: (%d,%d,%d) BlockIdx: (%d,%d,%d) BlockDim: (%d,%d,%d) GridDim: (%d,%d,%d)\n",
           threadIdx.x, threadIdx.y, threadIdx.z,
           blockIdx.x, blockIdx.y, blockIdx.z,
           blockDim.x, blockDim.y, blockDim.z,
           gridDim.x, gridDim.y, gridDim.z);
}