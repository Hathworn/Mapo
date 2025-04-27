#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_increment(int *matrix, size_t pitch, int colCount, int rowCount)
{
    // Use shared memory for accessing matrix elements efficiently
    extern __shared__ int sharedMem[];

    uint xOffset = blockIdx.x * blockDim.x + threadIdx.x;
    uint yOffset = blockIdx.y * blockDim.y + threadIdx.y;

    // Load data into shared memory
    if (xOffset < colCount && yOffset < rowCount)
    {
        int *memoryRow = (int *)((char *)matrix + xOffset * pitch);
        sharedMem[threadIdx.y * blockDim.x + threadIdx.x] = memoryRow[yOffset];
    }
    __syncthreads();

    // Perform increment operation
    if (xOffset < colCount && yOffset < rowCount)
    {
        sharedMem[threadIdx.y * blockDim.x + threadIdx.x]++;
    }
    __syncthreads();

    // Write results back to global memory
    if (xOffset < colCount && yOffset < rowCount)
    {
        int *memoryRow = (int *)((char *)matrix + xOffset * pitch);
        memoryRow[yOffset] = sharedMem[threadIdx.y * blockDim.x + threadIdx.x];
    }
}