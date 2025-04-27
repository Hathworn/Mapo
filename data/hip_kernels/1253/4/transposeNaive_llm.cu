#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeNaive(float *odata, float *idata, int width, int height)
{
    // Calculate global thread indices
    int xIndex = blockIdx.x * TILE_DIM + threadIdx.x;
    int yIndex = blockIdx.y * TILE_DIM + threadIdx.y;

    // Check boundary conditions
    if (xIndex < width && yIndex < height) {
        int index_in = xIndex + width * yIndex;

        // Unroll the loop for better performance
        for (int i = 0; i < TILE_DIM; i += BLOCK_ROWS) {
            int index_out = (yIndex + i) + height * xIndex;
            if (yIndex + i < height) {  // Boundary check for accesses
                odata[index_out] = idata[index_in + i * width];
            }
        }
    }
}