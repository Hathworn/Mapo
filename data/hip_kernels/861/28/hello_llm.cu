#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Use a single thread in each block to print
    if (threadIdx.x == 0)
    {
        printf("Hello world! I'm a thread in block %d\n", blockIdx.x);
    }
}