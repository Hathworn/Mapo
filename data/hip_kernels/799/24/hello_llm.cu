#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Use a single thread to avoid multiple prints
    if (threadIdx.x == 0)
    {
        printf("Hello world! This is %d threads\n", blockDim.x);
    }
}