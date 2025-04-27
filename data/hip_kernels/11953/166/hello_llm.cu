#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello() 
{
    // Calculate global thread ID
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure each thread prints a unique message
    printf("Hello world! I'm thread %d in block %d\n", globalThreadId, blockIdx.x);
}