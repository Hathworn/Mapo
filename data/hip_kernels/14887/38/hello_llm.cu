#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Use blockIdx.x and blockDim.x for better identification of threads in grid
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Hello world! I'm thread %d\n", globalThreadId);
}