#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void childKernel()
{
    // Use printf inside a block check to prevent clutter in block execution
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        printf("Hello\n");
    }
}