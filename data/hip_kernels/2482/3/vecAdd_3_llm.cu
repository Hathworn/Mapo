#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd_3(double *a, double *b, double *c, int n)
{
    // Calculate unique thread/global index
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by iterating only if id is within bounds
    while (id < n * n)
    {
        c[id] = a[id] + b[id];
        
        // Increment id to process next element in this thread
        id += blockDim.x * gridDim.x;
    }
}