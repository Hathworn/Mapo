#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Use block and thread indices to identify each thread uniquely
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Hello world! I'm thread %d in block %d\n", globalThreadId, blockIdx.x);
}