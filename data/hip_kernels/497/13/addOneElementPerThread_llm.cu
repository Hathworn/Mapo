#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addOneElementPerThread(double* a, double* b, double* c, int n)
{
    // Calculate global thread ID for both x and y dimensions
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Calculate the linear index
    int id = idy * n + idx;

    // Ensure within bounds before operation
    if (idx < n && idy < n)
    {
        // Efficiently load values from global memory, compute, and store result
        double val_a = a[id];
        double val_b = b[id];
        c[id] = val_a + val_b;
    }
}