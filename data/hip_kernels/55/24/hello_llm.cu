#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Use more descriptive message and threadIdx.y to provide additional context
    printf("Hello from block %d, thread %d\n", blockIdx.x, threadIdx.x);
}