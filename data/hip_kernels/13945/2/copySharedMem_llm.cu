#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copySharedMem(float *odata, float *idata, int width, int height)
{
    __shared__ float tile[TILE_DIM][TILE_DIM];

    int xIndex = blockIdx.x * TILE_DIM + threadIdx.x;
    int yIndex = blockIdx.y * TILE_DIM + threadIdx.y;
    
    int index = xIndex + width * yIndex;

    // Preload data into shared memory with bounds checking
    if (xIndex < width && yIndex < height)
    {
        for (int i = 0; i < TILE_DIM; i += BLOCK_ROWS)
        {
            if (yIndex + i < height) // Ensure index is within bounds
            {
                tile[threadIdx.y + i][threadIdx.x] = idata[index + i * width];
            }
        }
    }
    
    __syncthreads();
    
    // Write shared memory data to global memory with bounds checking
    if (xIndex < height && yIndex < width)
    {
        for (int i = 0; i < TILE_DIM; i += BLOCK_ROWS)
        {
            if (yIndex + i < width) // Ensure index is within bounds
            {
                odata[index + i * width] = tile[threadIdx.y + i][threadIdx.x];
            }
        }
    }
}