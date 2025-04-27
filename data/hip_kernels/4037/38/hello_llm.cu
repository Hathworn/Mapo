#include "hip/hip_runtime.h"
#include "includes.h"

// Use placeholders for both block and thread indices
__global__ void hello()
{
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Hello world! I'm thread %d in block %d\n", globalThreadId, blockIdx.x);
}