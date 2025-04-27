```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeCoarseGrained(float *odata, float *idata, int width, int height)
{
    __shared__ float block[TILE_DIM][TILE_DIM+1];

    // Calculate input and output indices
    int xIndex_in = blockIdx.x * TILE_DIM + threadIdx.x;
    int yIndex_in = blockIdx.y * TILE_DIM + threadIdx.y;
    int index_in = xIndex_in + (yIndex_in)*width;

    int xIndex_out = blockIdx.y * TILE_DIM + threadIdx.x;
    int yIndex_out = blockIdx.x * TILE_DIM + threadIdx.y;
    int index_out = xIndex_out + (yIndex_out)*height;

    // Coalesced global memory read
    for (int i = 0; i < TILE_DIM; i += BLOCK_ROWS) {
        block[threadIdx.y+i][threadIdx.x] = idata[index_in+i*width];
    }

    __syncthreads();

    // Coalesced global memory write
    for (int i = 0; i < TILE_DIM; i += BLOCK_ROWS) {
        odata[index_out+i*height] = block[threadIdx.y+i][threadIdx.x];
    }
}
```
