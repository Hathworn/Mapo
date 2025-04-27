#include "hip/hip_runtime.h"
#include "includes.h"

// Nmber of blocks
#define N (2048*2048)
#define THREADS_PER_BLOCK 512

__global__ void add(int *a, int *b, int *c)
{
    // Calculate unique global index for each thread
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Ensure index does not exceed the array bounds
    if (index < N) {
        c[index] = a[index] + b[index];
    }
}