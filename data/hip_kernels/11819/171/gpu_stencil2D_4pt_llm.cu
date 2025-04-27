#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // Compute indices for shared memory
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Calculate global and shared memory indices
    int baseGlobalIdx = HALO * N + blockIdx.x * blockDim.x * TILE_SIZE * N + threadIdx.x * TILE_SIZE * N + HALO;
    int baseShMemIdx = HALO * smColDim + threadIdx.x * smColDim * TILE_SIZE + HALO;

    // Copy inner part to shared memory
    for (int i = 0; i < TILE_SIZE; i++)
    {
        for (int j = 0; j < TILE_SIZE; j++)
        {
            int globalIndex = baseGlobalIdx + i * N + blockIdx.y * blockDim.y * TILE_SIZE + threadIdx.y * TILE_SIZE + j;
            int shMemIndex = baseShMemIdx + i * smColDim + threadIdx.y * TILE_SIZE + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Copy halos into shared memory only by first thread of block
    if (threadIdx.x == 0 && threadIdx.y == 0)
    {
        int indexTop, indexBottom, indexLeft, indexRight;
        
        // For Bottom and top row halos
        for (int i = 0; i < HALO; i++)
        {
            for (int j = 0; j < smColDim; j++)
            {
                indexTop = (blockIdx.x * blockDim.x * TILE_SIZE + i) * N + blockIdx.y * blockDim.y * TILE_SIZE + j;
                indexBottom = (HALO + (blockIdx.x + 1) * blockDim.x * TILE_SIZE) * N + blockIdx.y * blockDim.y * TILE_SIZE + j;
                shSrc[i * smColDim + j] = src[indexTop];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[indexBottom];
            }
        }
        
        // For right and left column halos
        for (int i = 0; i < HALO; i++)
        {
            for (int j = 0; j < smRowDim - HALO * 2; j++)
            {
                indexLeft = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + blockIdx.y * blockDim.y * TILE_SIZE + i;
                indexRight = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + (blockIdx.y + 1) * blockDim.y * TILE_SIZE + HALO + i;
                shSrc[(HALO + j) * smColDim + i] = src[indexLeft];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[indexRight];
            }
        }
    }

    __syncthreads();

    // Perform stencil operation
    for (int i = 0; i < TILE_SIZE; i++)
    {
        for (int j = 0; j < TILE_SIZE; j++)
        {
            int globalIndex = baseGlobalIdx + i * N + blockIdx.y * blockDim.y * TILE_SIZE + threadIdx.y * TILE_SIZE + j;
            int shMemIndex = baseShMemIdx + i * smColDim + threadIdx.y * TILE_SIZE + j;

            // Load neighbors
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east  = shSrc[shMemIndex + 1];
            double west  = shSrc[shMemIndex - 1];

            // Compute stencil result
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }
    
    __syncthreads();
}