#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeCoalesced(float *odata, float *idata, int width, int height)
{
    __shared__ float tile[TILE_DIM][TILE_DIM+1]; // Add padding to avoid bank conflicts

    int xIndex = blockIdx.x * TILE_DIM + threadIdx.x;
    int yIndex = blockIdx.y * TILE_DIM + threadIdx.y;
    int index_in = xIndex + (yIndex)*width;

    xIndex = blockIdx.y * TILE_DIM + threadIdx.x;
    yIndex = blockIdx.x * TILE_DIM + threadIdx.y;
    int index_out = xIndex + (yIndex)*height;

    // Coalesced read from global memory
    if(xIndex < width && (yIndex + BLOCK_ROWS - 1) < height) {
        for (int i=0; i<TILE_DIM; i+=BLOCK_ROWS) {
            tile[threadIdx.y+i][threadIdx.x] = idata[index_in+i*width];
        }
    }

    __syncthreads();

    if(yIndex < height && (xIndex + BLOCK_ROWS - 1) < width) {
        // Coalesced write to global memory
        for (int i=0; i<TILE_DIM; i+=BLOCK_ROWS) {
            odata[index_out+i*height] = tile[threadIdx.x][threadIdx.y+i];
        }
    }
}