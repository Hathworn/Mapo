#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function with thread and block indexing
__global__ void hello_from_gpu()
{
    // Consolidated indexing
    printf("Hello World from block-%d and thread-(%d, %d)!\n", blockIdx.x, threadIdx.x, threadIdx.y);
}