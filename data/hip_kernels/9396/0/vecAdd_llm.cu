#include "hip/hip_runtime.h"
#include "includes.h"

// CUDA kernel optimized to compute C = k * A + B for each element

__global__ void vecAdd(double *a, double *b, double *c, int n, int k)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread operates within bounds
    if (id < n) {
        c[id] = k * a[id] + b[id];
    }
}