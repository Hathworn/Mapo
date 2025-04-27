#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mat_transpose(float *a, float *out, int size_x, int size_y)
{
    __shared__ float tile[32][33]; // Use shared memory to improve access patterns

    const int tile_x = threadIdx.x;
    const int tile_y = threadIdx.y;
    const int x = blockIdx.x * blockDim.x + tile_x;
    const int y = blockIdx.y * blockDim.y + tile_y;

    if (x < size_x && y < size_y) {
        tile[tile_y][tile_x] = a[y * size_y + x]; // Load data into shared memory
    }
    __syncthreads();

    const int transposed_x = blockIdx.y * blockDim.y + tile_x;
    const int transposed_y = blockIdx.x * blockDim.x + tile_y;

    if (transposed_x < size_y && transposed_y < size_x) {
        out[transposed_x * size_x + transposed_y] = tile[tile_x][tile_y]; // Write transposed data
    }
}