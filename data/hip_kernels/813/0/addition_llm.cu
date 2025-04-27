#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function for adding two numbers
__global__ void addition(int a, int b, int *c)
{
    // Calculate unique thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform addition only for the first thread to minimize divergence
    if (idx == 0)
    {
        *c = a + b;
    }
}