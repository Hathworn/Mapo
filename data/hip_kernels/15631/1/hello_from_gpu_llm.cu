#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel by reducing printf usage in large grid dimensions
__global__ void hello_from_gpu()
{
    const int tid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread ID
    printf("Hello World from block %d and thread %d!\n", blockIdx.x, threadIdx.x); // Reduced to a single printf
}