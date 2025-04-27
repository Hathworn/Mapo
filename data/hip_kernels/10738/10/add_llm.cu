#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int *a, int *b, int *c, int columns, int rows)
{
    // Use shared memory to cache input data
    __shared__ int tileA[32][32];
    __shared__ int tileB[32][32];

    // Calculate global thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Load data into shared memory if within bounds
    if (x < columns && y < rows)
    {
        int index = y * columns + x;
        tileA[threadIdx.y][threadIdx.x] = a[index];
        tileB[threadIdx.y][threadIdx.x] = b[index];

        // Synchronize to ensure data is loaded
        __syncthreads();

        // Perform computation using shared memory
        c[index] = tileA[threadIdx.y][threadIdx.x] + tileB[threadIdx.y][threadIdx.x];
    }
}