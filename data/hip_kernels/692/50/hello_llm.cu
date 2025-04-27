#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Calculate global thread ID for unique thread identification
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Hello world! I'm thread %d\n", globalThreadId);
}