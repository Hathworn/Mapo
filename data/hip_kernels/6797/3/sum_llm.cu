#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void sum(int *a, int *b, int n)
{
    // Calculate unique thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    int sum = 0;

    // Loop stride to handle array elements
    for (int i = idx; i < n; i += gridDim.x * blockDim.x)
    {
        sum += a[i];
    }

    // Atomic add to avoid race conditions when writing to b
    atomicAdd(&b[blockIdx.x], sum);
}