#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Optimize printf by storing block index in a register
    int blockIndex = blockIdx.x;
    printf("Hello world! I'm a thread in block %d\n", blockIndex);
}