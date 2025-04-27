#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function to make use of multiple threads
__global__ void hello_from_gpu()
{
    // Use thread ID for conditional printing to demonstrate parallel execution
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    if (tid == 0) // Only let the first thread print
    {
        printf("Hello World from the GPU!\n");
    }
}