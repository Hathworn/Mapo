#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function with optimized thread index access
__global__ void print() 
{
    // Using block index and block dimension to uniquely identify each thread globally
    int globalId = blockDim.x * blockIdx.x + threadIdx.x;
    printf("hello from gpu thread %d\n", globalId);
}