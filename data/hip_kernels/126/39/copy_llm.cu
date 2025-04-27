#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copy(float *odata, const float *idata)
{
    // Calculate the global index
    int x = blockIdx.x * TILE_DIM + threadIdx.x;
    int y = blockIdx.y * TILE_DIM + threadIdx.y;
    int width = gridDim.x * TILE_DIM;

    // Use shared memory for performance boost
    __shared__ float tile[TILE_DIM][TILE_DIM];
    
    for (int j = 0; j < TILE_DIM; j+= BLOCK_ROWS)
    {
        // Load data into shared memory
        if (y + j < gridDim.y * TILE_DIM && x < gridDim.x * TILE_DIM)
        {
            tile[threadIdx.y+j][threadIdx.x] = idata[(y+j)*width + x];
        }
        __syncthreads();
        
        // Store data from shared memory to global memory
        if (y + j < gridDim.y * TILE_DIM && x < gridDim.x * TILE_DIM)
        {
            odata[(y+j)*width + x] = tile[threadIdx.y+j][threadIdx.x];
        }
        __syncthreads();
    }
}