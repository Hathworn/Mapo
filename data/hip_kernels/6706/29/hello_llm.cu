```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Each block calculates its unique thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Print statement optimized to include thread ID
    printf("Hello world! I'm thread %d in block %d\n", tid, blockIdx.x);
}