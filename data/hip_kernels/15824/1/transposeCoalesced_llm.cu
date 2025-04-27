#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeCoalesced(float *odata, const float *idata, int idata_rows, int idata_cols)
{
    __shared__ float tile[TILE_SIZE][TILE_SIZE+1];

    // Calculate indices
    int x = blockIdx.x * TILE_SIZE + threadIdx.x;
    int y = blockIdx.y * TILE_SIZE + threadIdx.y;

    // Load data into shared memory with coalescing
    if (x < idata_cols) {
        for (int j = 0; j < TILE_SIZE; j += BLOCK_SIZE) {
            if ((y + j) < idata_rows) {
                tile[threadIdx.y + j][threadIdx.x] = idata[(y + j) * idata_cols + x];
            }
        }
    }

    __syncthreads();

    // Swap block offset for transposing
    x = blockIdx.y * TILE_SIZE + threadIdx.x;
    y = blockIdx.x * TILE_SIZE + threadIdx.y;

    // Store transposed data from shared memory to global memory
    if (x < idata_rows) {
        for (int j = 0; j < TILE_SIZE; j += BLOCK_SIZE) {
            if ((y + j) < idata_cols) {
                odata[(y + j) * idata_rows + x] = tile[threadIdx.x][threadIdx.y + j];
            }
        }
    }
}