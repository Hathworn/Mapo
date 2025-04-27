#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access by utilizing shared memory
__global__ void add(int *a, int *b, int *c)
{
    extern __shared__ int sharedMem[];
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Load data into shared memory
    sharedMem[threadIdx.x] = a[index];
    sharedMem[threadIdx.x + blockDim.x] = b[index];
    __syncthreads();

    // Compute the result using shared memory
    c[index] = sharedMem[threadIdx.x] + sharedMem[threadIdx.x + blockDim.x];
}