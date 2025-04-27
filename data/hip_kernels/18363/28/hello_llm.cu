#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Improved performance by eliminating repeated blockIdx.x access
    int block_id = blockIdx.x;
    printf("Hello world! I'm a thread in block %d\n", block_id);
}