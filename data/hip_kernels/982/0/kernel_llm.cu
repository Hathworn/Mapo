#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX_BUF 100000000
typedef unsigned int UINT;

UINT buffer[MAX_BUF];

// Optimized kernel function with thread and block calculations
__global__ void kernel(UINT *buffer, UINT size)
{
    // Calculate the global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Avoid out-of-bound accesses
    if (idx < size)
    {
        // Example computation: doubling each buffer element
        buffer[idx] *= 2;
    }
}