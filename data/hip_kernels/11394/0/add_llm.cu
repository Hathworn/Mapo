#include "hip/hip_runtime.h"
#include "includes.h"

// Define and implement the GPU addition function
// This version is a vector addition, with N threads
// and N blocks
// Adding one a and b instance and storing in one c instance.

// Number of blocks
#define N (2048*2048)
#define THREADS_PER_BLOCK 512

__global__ void add(int *a, int *b, int *c)
{
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    if (index < N) // Ensure no out-of-bounds access
    {
        c[index] = a[index] + b[index];
    }
}