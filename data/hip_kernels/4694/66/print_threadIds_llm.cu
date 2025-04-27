#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void print_threadIds()
{
    // Use block-wide printf for collective thread coordination
    printf("Block %d, threadIdx.x : %d, threadIdx.y : %d, threadIdx.z : %d \n",
           blockIdx.x, threadIdx.x, threadIdx.y, threadIdx.z);
}