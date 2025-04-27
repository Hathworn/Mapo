#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel function by using threadIdx and gridDim for fine-grained control
__global__ void hello()
{
    // Calculate global thread index
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Print statement using thread and block indices
    printf("Hello world! I'm thread %d in block %d\n", globalThreadId, blockIdx.x);
}