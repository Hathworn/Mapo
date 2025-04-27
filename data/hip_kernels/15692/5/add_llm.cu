#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c)
{
    // Calculate unique thread index
    int threadID = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure kernel handles all elements by iterating in steps
    for (int idx = threadID; idx < N; idx += blockDim.x * gridDim.x)
    {
        c[idx] = a[idx] + b[idx]; // Perform addition
    }
}