#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void get_average(unsigned char * img, int * nz, int * average, int scale)
{
    int x = blockIdx.x * TILE_DIM + threadIdx.x;
    int y = blockIdx.y * TILE_DIM + threadIdx.y;
    int width = gridDim.x * TILE_DIM;

    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS)
    {
        int iw = x;
        int ih = y + j;

        int pixel_index = 3 * (ih * width + iw); // Compute base index only once
        int r = img[pixel_index];
        int g = img[pixel_index + 1];
        int b = img[pixel_index + 2];

        if (r + g + b > 0)
        {
            int scaled_index = ih / scale * width + iw / scale; // Compute scaled index only once
            atomicAdd(&(nz[scaled_index]), 1);
            atomicAdd(&(average[3 * scaled_index]), r);
            atomicAdd(&(average[3 * scaled_index + 1]), g);
            atomicAdd(&(average[3 * scaled_index + 2]), b);
        }
    }
}