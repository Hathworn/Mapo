#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mat_sub(float *a, float *b, float *c, int rows, int columns)
{
    // Calculate 1D index from 2D grid
    int index = blockIdx.y * blockDim.x * blockDim.y + blockIdx.x * blockDim.x + threadIdx.y * blockDim.x + threadIdx.x;
    int total_threads = gridDim.x * gridDim.y * blockDim.x * blockDim.y;
    
    // Use stride loop to process all elements
    for (int k = index; k < rows * columns; k += total_threads) {
        c[k] = a[k] - b[k];
    }
}