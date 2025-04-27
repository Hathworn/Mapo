#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Use blockIdx.x and threadIdx.x to identify the thread. This optimizes the thread's printing operation.
    printf("Hello world! I'm thread %d in block %d\n", threadIdx.x, blockIdx.x);
}