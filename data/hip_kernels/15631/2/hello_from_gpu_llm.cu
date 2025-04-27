#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello_from_gpu()
{
    // Use built-in variable for combined thread and block index
    int idx = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;

    // Improved printf to reduce overhead per thread
    printf("Hello World from block-%d and linear thread-%d!\n", blockIdx.x, idx);
}