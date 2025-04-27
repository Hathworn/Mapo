#include "hip/hip_runtime.h"
#include "includes.h"

#define NUM_BLOCKS 16
#define BLOCK_WIDTH 16

__global__ void hello()
{
    // Calculate the global thread index for more unique identification
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Hello world! I'm a thread %d in block %d, global thread id %d\n", 
           threadIdx.x, blockIdx.x, globalThreadId);
}