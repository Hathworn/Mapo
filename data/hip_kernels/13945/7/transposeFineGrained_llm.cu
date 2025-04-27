#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeFineGrained(float *odata, float *idata, int width, int height)
{
    __shared__ float block[TILE_DIM][TILE_DIM+1]; // Padding to avoid bank conflicts.

    int xIndex = blockIdx.x * TILE_DIM + threadIdx.x;
    int yIndex = blockIdx.y * TILE_DIM + threadIdx.y;

    // Optimize: Check bounds to prevent out-of-bounds memory access.
    if (xIndex < width && yIndex < height) {
        int index = xIndex + yIndex * width;

        // Load matrix tile into shared memory
        for (int i = 0; i < TILE_DIM && (threadIdx.y + i < height); i += BLOCK_ROWS)
        {
            block[threadIdx.y + i][threadIdx.x] = idata[index + i * width];
        }

        __syncthreads();

        // Write transposed tile to output matrix
        for (int i = 0; i < TILE_DIM && (threadIdx.x + i < width); i += BLOCK_ROWS)
        {
            // Adjust column index using height here for correct transposition
            odata[(blockIdx.y * TILE_DIM + threadIdx.x) + (blockIdx.x * TILE_DIM + threadIdx.y + i) * height] = block[threadIdx.x + i][threadIdx.y];
        }
    }
}