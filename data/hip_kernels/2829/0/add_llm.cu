#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to add the elements of two arrays

__global__ void add(int n, float *x, float *y)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Optimize memory access by iterating over the global stride
    for (int i = index; i < n; i += stride)
        y[i] = x[i] + y[i];
}