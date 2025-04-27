#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int* a, int* b, int* c)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Compute sum if within bounds
    if (id < N)
    {
        c[id] = b[id] + a[id];
    }
}