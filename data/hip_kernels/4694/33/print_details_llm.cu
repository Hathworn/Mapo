#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void print_details()
{
    // Group related variables into a single printf to reduce overhead
    printf("blockIdx: (%d, %d, %d), blockDim: (%d, %d), gridDim: (%d, %d)\n",
           blockIdx.x, blockIdx.y, blockIdx.z, blockDim.x, blockDim.y, gridDim.x, gridDim.y);
}