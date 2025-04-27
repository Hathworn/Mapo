#include "hip/hip_runtime.h"
#include "includes.h"
#define N 100

__global__ void add(int *a, int *c)
{
    // Calculate unique thread index
    int tID = blockIdx.x * blockDim.x + threadIdx.x; 
    if (tID < N) // Ensure index is within bounds
    {
        c[tID] = 3 * a[tID];
    }
}