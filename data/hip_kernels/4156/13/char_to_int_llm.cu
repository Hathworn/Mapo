#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void char_to_int(int * img2, unsigned char * img)
{
    // Calculate the starting x and y index for the thread
    int x = blockIdx.x * TILE_DIM + threadIdx.x;
    int y = blockIdx.y * TILE_DIM + threadIdx.y;

    // Calculate image width
    int width = gridDim.x * TILE_DIM;

    // Optimize: Unroll the loop to improve memory access pattern and reduce loop overhead
    #pragma unroll
    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS) {
        int index = (y + j) * width + x;
        int r = img[3 * index];
        int g = img[3 * index + 1];
        int b = img[3 * index + 2];

        // Convert RGB to int and store in img2
        img2[index] = (r << 16) | (g << 8) | b;
    }
}