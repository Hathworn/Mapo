#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double *dst, double *src, int M, int N)
{
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double *shSrc = shared_mem;

    // indexes
    int i, j;

    // neighbor's values
    double north, south, east, west;

    // SharedMem Columns Dimension
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Calculate global and shared memory indices at once
    int baseGlobalIndex = HALO * N + blockIdx.x * blockDim.x * TILE_SIZE * N + blockIdx.y * blockDim.y * TILE_SIZE + HALO;
    int baseShMemIndex = HALO * smColDim + threadIdx.x * smColDim * TILE_SIZE + HALO;

    // Copying to shared memory
    // Inner part: use individual threads to copy their region
    for (i = 0; i < TILE_SIZE; ++i)
    {
        for (j = 0; j < TILE_SIZE; ++j)
        {
            int globalIndex = baseGlobalIndex + threadIdx.x * TILE_SIZE * N + i * N + threadIdx.y * TILE_SIZE + j;
            int shMemIndex = baseShMemIndex + i * smColDim + threadIdx.y * TILE_SIZE + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Synchronize before copying halos
    __syncthreads();

    // Halos
    if (threadIdx.x == 0 && threadIdx.y == 0)
    {
        int indexTopHalo, indexBottomHalo, indexLeftHalo, indexRightHalo;

        // Using direct blocks to fill halos
        int blockOffset = blockIdx.x * blockDim.x * TILE_SIZE;
        int nextBlockOffset = (HALO + (blockIdx.x + 1) * blockDim.x * TILE_SIZE) * N;

        // For Bottom and top rows
        for (i = 0; i < HALO; ++i)
        {
            for (j = 0; j < smColDim; ++j)
            {
                indexTopHalo = blockOffset * N + (blockIdx.y * blockDim.y * TILE_SIZE) + j + i * N;
                indexBottomHalo = nextBlockOffset + j + i * N;
                shSrc[i * smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[indexBottomHalo];
            }
        }

        // For right and left Columns
        for (i = 0; i < HALO; ++i)
        {
            for (j = 0; j < smRowDim - HALO * 2; ++j)
            {
                int rowOffset = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + (blockIdx.y * blockDim.y * TILE_SIZE);
                indexLeftHalo = rowOffset + i;
                indexRightHalo = rowOffset + ((blockIdx.y + 1) * blockDim.y * TILE_SIZE) + HALO + i;
                shSrc[(HALO + j) * smColDim + i] = src[indexLeftHalo];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[indexRightHalo];
            }
        }
    }

    // Synchronize to ensure all halo data is up-to-date
    __syncthreads();

    // Perform stencil operation
    for (i = 0; i < TILE_SIZE; ++i)
    {
        for (j = 0; j < TILE_SIZE; ++j)
        {
            int globalIndex = baseGlobalIndex + threadIdx.x * TILE_SIZE * N + i * N + threadIdx.y * TILE_SIZE + j;
            int shMemIndex = baseShMemIndex + i * smColDim + threadIdx.y * TILE_SIZE + j;

            // Getting the neighbors
            north = shSrc[shMemIndex - smColDim];
            south = shSrc[shMemIndex + smColDim];
            east  = shSrc[shMemIndex + 1];
            west  = shSrc[shMemIndex - 1];

            // Real Stencil operation
            dst[globalIndex] = (north + south + east + west) / 4.0; // Adjusted average denominator
        }
    }
}
```
