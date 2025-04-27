#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello2D()
{
    // Calculate unique global thread ID more efficiently
    int tid = (blockIdx.y * gridDim.x + blockIdx.x) * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;

    printf("I am thread (%d, %d) in block (%d, %d). Global thread ID = %d\n", threadIdx.y, threadIdx.x, blockIdx.y, blockIdx.x, tid);
}