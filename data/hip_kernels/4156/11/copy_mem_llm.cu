#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copy_mem(unsigned char *source, unsigned char *render)
{
    // Calculate x and y indices
    int x = blockIdx.x * TILE_DIM + threadIdx.x;
    int y = blockIdx.y * TILE_DIM + threadIdx.y;
    int width = gridDim.x * TILE_DIM;

    // Use shared memory for coalesced access
    __shared__ unsigned char sharedMem[TILE_DIM * (TILE_DIM + BLOCK_ROWS) * 3];
    
    // Load data into shared memory
    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS) {
        for (int channel = 0; channel < 3; channel++) {
            int globalIndex = 3 * ((y + j) * width + x) + channel;
            int localIndex = 3 * (threadIdx.y * TILE_DIM + threadIdx.x + j) + channel;
            sharedMem[localIndex] = source[globalIndex];
        }
    }
    __syncthreads();

    // Copy from shared memory to global memory
    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS) {
        for (int channel = 0; channel < 3; channel++) {
            int globalIndex = 3 * ((y + j) * width + x) + channel;
            int localIndex = 3 * (threadIdx.y * TILE_DIM + threadIdx.x + j) + channel;
            render[globalIndex] = sharedMem[localIndex];
        }
    }
}