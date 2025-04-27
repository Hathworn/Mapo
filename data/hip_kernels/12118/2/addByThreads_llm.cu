#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addByThreads(int *a, int *b, int *c)
{
    // Calculate the global index for each thread
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Ensure index does not exceed array bounds
    if (idx < N) {
        c[idx] = a[idx] + b[idx];
    }
}