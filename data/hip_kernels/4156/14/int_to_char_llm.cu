#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void int_to_char(int * img2, unsigned char * img)
{
    int x = blockIdx.x * TILE_DIM + threadIdx.x;
    int y = blockIdx.y * TILE_DIM + threadIdx.y;
    int width = gridDim.x * TILE_DIM;

    // Optimize loop by unrolling for efficiency
    #pragma unroll
    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS) {
        int idx = (y + j) * width + x;
        int val = img2[idx];
        
        img[3 * idx    ] = val / (256 * 256);
        img[3 * idx + 1] = (val / 256) % 256;
        img[3 * idx + 2] = val % 256;
    }
}