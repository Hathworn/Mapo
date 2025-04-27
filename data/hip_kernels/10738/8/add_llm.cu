#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c, int columns, int rows)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Use a single calculation for global index
    int idy = blockIdx.y * blockDim.y + threadIdx.y; // Use a single calculation for global index
    int index = idy * columns + idx; // Calculate index based on 2D grid

    if (idx < columns && idy < rows) { // Ensure within bounds before accessing memory
        c[index] = a[index] + b[index]; // Perform addition
    }
}