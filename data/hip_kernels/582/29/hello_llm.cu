#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Use blockDim.x instead of threadIdx.x for more threads across blocks
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Hello world! I'm thread %d\n", globalThreadId);
}