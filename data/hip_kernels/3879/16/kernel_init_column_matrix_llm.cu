#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_init_column_matrix(int *matrix, size_t pitch, size_t colCount, size_t rowCount)
{
    // Calculate unique thread index
    uint xOffset = blockIdx.x * blockDim.x + threadIdx.x;
    uint yOffset = blockIdx.y * blockDim.y + threadIdx.y;

    // Optimize by using stride for better memory coalescing
    uint strideX = gridDim.x * blockDim.x;
    uint strideY = gridDim.y * blockDim.y;

    // Loop with strided access
    for (uint x = xOffset; x < colCount; x += strideX) {
        for (uint y = yOffset; y < rowCount; y += strideY) {
            int *memoryRow = (int *)((char *)matrix + (x * pitch));
            memoryRow[y] = x * rowCount + y;
        }
    }
}