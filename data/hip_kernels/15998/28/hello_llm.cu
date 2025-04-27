#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Use threadIdx.x to differentiate between threads within the block
    printf("Hello world! I'm a thread %d in block %d\n", threadIdx.x, blockIdx.x);
}