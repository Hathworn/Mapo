#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd(double *a, double *b, double *c, int n) 
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use warp-based optimization by processing multiple elements if possible
    int stride = blockDim.x * gridDim.x;
    for (int i = id; i < n; i += stride) {
        c[i] = a[i] * b[i];
    }
}