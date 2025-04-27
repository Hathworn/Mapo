#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Each thread in the block prints its own unique statement
    printf("Hello world! I'm thread (%d, %d) in block (%d, %d)\n", threadIdx.x, threadIdx.y, blockIdx.x, blockIdx.y);
}