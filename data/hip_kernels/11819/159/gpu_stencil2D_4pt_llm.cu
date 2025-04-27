#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // indexes
    int i, j;

    // neighbor's values
    double north, south, east, west;

    // SharedMem Columns Dimension
    int smColDim = HALO*2+blockDim.y*TILE_SIZE;
    int smRowDim = HALO*2+blockDim.x*TILE_SIZE;

    // Copying to shared memory

    // Inner part
    // Use one-dimensional thread index and grid index calculations to improve performance
    int globalOffset = HALO*N + blockIdx.x * blockDim.x * TILE_SIZE * N + blockIdx.y * blockDim.y * TILE_SIZE;
    int shMemOffset = HALO * smColDim + HALO;

    for (i = 0; i < TILE_SIZE; i++) {
        for (j = 0; j < TILE_SIZE; j++) {
            int globalIndex = globalOffset + threadIdx.x * TILE_SIZE * N + i * N + threadIdx.y * TILE_SIZE + j;
            int shMemIndex = shMemOffset + threadIdx.x * smColDim * TILE_SIZE + i * smColDim + threadIdx.y * TILE_SIZE + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    __syncthreads();

    // Handles Halo regions
    if (threadIdx.x == 0 && threadIdx.y == 0) {

        // Use one-dimensional loop index for optimization
        int topHaloOffset = blockIdx.x * blockDim.x * TILE_SIZE * N + blockIdx.y * blockDim.y * TILE_SIZE;
        int bottomHaloOffset = (HALO + (blockIdx.x + 1) * blockDim.x * TILE_SIZE) * N + blockIdx.y * blockDim.y * TILE_SIZE;
        int leftHaloOffset = HALO + blockIdx.x * blockDim.x * TILE_SIZE;
        int rightHaloOffset = HALO + blockIdx.x * blockDim.x * TILE_SIZE + ((blockIdx.y + 1) * blockDim.y * TILE_SIZE)+HALO;

        // For bottom and top row
        for (i = 0; i < HALO; i++) {
            for (j = 0; j < smColDim; j++) {
                shSrc[i * smColDim + j] = src[topHaloOffset + i * N + j];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[bottomHaloOffset + i * N + j];
            }
        }

        // For right and left Columns
        for (i = 0; i < HALO; i++) {
            for (j = 0; j < smRowDim - HALO * 2; j++) {
                shSrc[(HALO + j) * smColDim + i] = src[(leftHaloOffset + j) * N + blockIdx.y * blockDim.y * TILE_SIZE + i];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[(rightHaloOffset + j) * N + blockIdx.y * blockDim.y * TILE_SIZE + HALO + i];
            }
        }
    }

    __syncthreads();

    // Perform stencil computation
    for (i = 0; i < TILE_SIZE; i++) {
        for (j = 0; j < TILE_SIZE; j++) {
            int globalIndex = globalOffset + threadIdx.x * TILE_SIZE * N + i * N + threadIdx.y * TILE_SIZE + j;
            int shMemIndex = shMemOffset + threadIdx.x * smColDim * TILE_SIZE + i * smColDim + threadIdx.y * TILE_SIZE + j;

            // Getting the neighbors
            north = shSrc[shMemIndex - smColDim];
            south = shSrc[shMemIndex + smColDim];
            east  = shSrc[shMemIndex + 1];
            west  = shSrc[shMemIndex - 1];
            // Real Stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
            // dst[globalIndex] = (north + south + east + west) / 4;
        }
    }

    __syncthreads();
}
```
