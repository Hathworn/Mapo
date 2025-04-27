#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencil_2d(int *in, int *out) {
    // Calculate the global row and column index
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Define tile size and size of the apron
    const int TILE_WIDTH = blockDim.x;
    const int APERTURE = 1;  // Assuming a 3x3 stencil

    // Shared memory to hold the input tile and its halo
    __shared__ int tile[TILE_WIDTH + 2 * APERTURE][TILE_WIDTH + 2 * APERTURE];
    
    // Load data into shared memory, including the halo
    int haloRow = row - APERTURE;
    int haloCol = col - APERTURE;
    if (haloRow >= 0 && haloRow < gridDim.y * TILE_WIDTH + 2 * APERTURE &&
        haloCol >= 0 && haloCol < gridDim.x * TILE_WIDTH + 2 * APERTURE) {
        tile[threadIdx.y + APERTURE][threadIdx.x + APERTURE] = in[haloRow * (gridDim.x * TILE_WIDTH) + haloCol];
    }

    // Load halo region (left, right, top, bottom)
    if (threadIdx.x < APERTURE) {
        if (haloCol - APERTURE >= 0) {
            tile[threadIdx.y + APERTURE][threadIdx.x] = in[haloRow * (gridDim.x * TILE_WIDTH) + (haloCol - APERTURE)];
        }

        if (tile[threadIdx.y + APERTURE][threadIdx.x + TILE_WIDTH + APERTURE] < gridDim.x * TILE_WIDTH) {
            tile[threadIdx.y + APERTURE][threadIdx.x + TILE_WIDTH + APERTURE] = 
                in[haloRow * (gridDim.x * TILE_WIDTH) + (haloCol + TILE_WIDTH)];
        }
    }

    if (threadIdx.y < APERTURE) {
        if (haloRow - APERTURE >= 0) {
            tile[threadIdx.y][threadIdx.x + APERTURE] = in[(haloRow - APERTURE) * (gridDim.x * TILE_WIDTH) + haloCol];
        }

        if (haloRow + TILE_WIDTH + APERTURE < gridDim.y * TILE_WIDTH) {
            tile[threadIdx.y + TILE_WIDTH + APERTURE][threadIdx.x + APERTURE] = 
                in[(haloRow + TILE_WIDTH) * (gridDim.x * TILE_WIDTH) + haloCol];
        }
    }

    __syncthreads();

    // Apply the stencil operation
    if (threadIdx.x >= APERTURE && threadIdx.x < TILE_WIDTH + APERTURE && 
        threadIdx.y >= APERTURE && threadIdx.y < TILE_WIDTH + APERTURE) {
        int result = 0;
        for (int dy = -APERTURE; dy <= APERTURE; dy++) {
            for (int dx = -APERTURE; dx <= APERTURE; dx++) {
                result += tile[threadIdx.y + dy][threadIdx.x + dx];
            }
        }
        if (row < gridDim.y * TILE_WIDTH && col < gridDim.x * TILE_WIDTH) {
            out[row * (gridDim.x * TILE_WIDTH) + col] = result;
        }
    }
}