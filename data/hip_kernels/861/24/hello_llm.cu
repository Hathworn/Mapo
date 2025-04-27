#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Store threadIdx.x in a register to reduce global memory access
    int tid = threadIdx.x;

    // Use blockIdx.y to demonstrate potential block-level parallelism
    printf("Hello world! I'm thread %d in block %d\n", tid, blockIdx.y);
}