#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello_from_gpu(void)
{
    // Using blockIdx and threadIdx to specify unique identifiers in the output
    printf("Hello World from the GPU! Block %d, Thread %d\n", blockIdx.x, threadIdx.x);
}