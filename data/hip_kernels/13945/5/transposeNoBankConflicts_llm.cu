#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeNoBankConflicts(float *odata, float *idata, int width, int height)
{
    __shared__ float tile[TILE_DIM][TILE_DIM+1];

    int xIndex = blockIdx.x * TILE_DIM + threadIdx.x;
    int yIndex = blockIdx.y * TILE_DIM + threadIdx.y;
    int index_in = xIndex + (yIndex)*width;

    xIndex = blockIdx.y * TILE_DIM + threadIdx.x;
    yIndex = blockIdx.x * TILE_DIM + threadIdx.y;
    int index_out = xIndex + (yIndex)*height;

    // Load data into shared memory efficiently
    if (xIndex < width && yIndex < height) {
        for (int i = 0; i < TILE_DIM; i += BLOCK_ROWS) {
            if (yIndex + i < height) {
                tile[threadIdx.y + i][threadIdx.x] = idata[index_in + i * width];
            }
        }
    }

    __syncthreads();

    // Write data from shared memory to output array efficiently
    if (xIndex < height && yIndex < width) {
        for (int i = 0; i < TILE_DIM; i += BLOCK_ROWS) {
            if (yIndex + i < width) {
                odata[index_out + i * height] = tile[threadIdx.x][threadIdx.y + i];
            }
        }
    }
}