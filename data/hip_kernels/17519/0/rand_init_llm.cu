#include "hip/hip_runtime.h"
#include "includes.h"
#define FALSE 0
#define TRUE  1

// Optimized to ensure tid is within bounds of array
__global__ void rand_init(long *a, long seed, size_t size)
{
    int tid = threadIdx.x + blockDim.x * blockIdx.x;
    if (tid < size) // Check bounds
    {
        a[tid] = seed + tid; // Use tid directly
    }
}