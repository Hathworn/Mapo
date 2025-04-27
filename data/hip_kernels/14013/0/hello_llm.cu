#include "hip/hip_runtime.h"
#include "includes.h"

#define NUM_BLOCKS 16
#define BLOCK_WIDTH 3

__global__ void hello()
{
    // Use variables to avoid repeated access to blockIdx and threadIdx
    int blockIndex = blockIdx.x;
    int threadIndex = threadIdx.x;

    // Use conditional execution to minimize unnecessary printf calls
    if (threadIndex < BLOCK_WIDTH && blockIndex < NUM_BLOCKS) {
        printf("Hello world! I'm the %dth thread in %dth block. \n", threadIndex, blockIndex);
    }
}