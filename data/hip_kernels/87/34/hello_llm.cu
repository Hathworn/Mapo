#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Use thread index for more precise identification
    printf("Hello world! I'm thread %d in block %d\n", threadIdx.x, blockIdx.x);
}