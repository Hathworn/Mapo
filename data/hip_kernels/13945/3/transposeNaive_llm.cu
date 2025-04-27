#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeNaive(float *odata, float *idata, int width, int height)
{
    // Calculate transposed block indices first
    int xIndex = blockIdx.y * TILE_DIM + threadIdx.x;
    int yIndex = blockIdx.x * TILE_DIM + threadIdx.y;

    // Calculate input and output indices
    int index_in  = yIndex + width * xIndex;
    int index_out = xIndex + height * yIndex;

    // Loop unrolling and data coalescing
    for (int i = 0; i < TILE_DIM; i += BLOCK_ROWS)
    {
        odata[index_out + i * height] = idata[index_in + i * width];
    }
}