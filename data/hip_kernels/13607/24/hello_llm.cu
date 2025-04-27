#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Use a block-based message to improve performance
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Hello world! I'm thread %d\n", tid);
}