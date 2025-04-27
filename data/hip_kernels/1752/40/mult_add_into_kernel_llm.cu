#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Calculate global thread index with grid stride loop
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = gridDim.x * blockDim.x; // Calculate total number of threads in the grid
    for(; i < n; i += gridSize) {
        c[i] += a[i] * b[i];
    }
}