#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // Neighbor's values
    double north, south, east, west;

    // SharedMem Dimensions
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;
    
    int baseColIndex = HALO + blockIdx.x * blockDim.x * TILE_SIZE * N + threadIdx.x * TILE_SIZE * N;
    int baseRowIndex = HALO + blockIdx.y * blockDim.y * TILE_SIZE + threadIdx.y * TILE_SIZE;

    // Copying to shared memory (Inner part)
    for (int i = 0; i < TILE_SIZE; i++)
    {
        for (int j = 0; j < TILE_SIZE; j++)
        {
            int globalIndex = baseColIndex + i * N + baseRowIndex + j;
            int shMemIndex = HALO * smColDim + threadIdx.x * smColDim * TILE_SIZE + i * smColDim + HALO + threadIdx.y * TILE_SIZE + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Halos (only copy once when both threads are zero)
    if (threadIdx.x == 0 && threadIdx.y == 0 )
    {
        int indexTopHalo, indexBottomHalo, indexLeftHalo, indexRightHalo;

        // Top and bottom rows
        for (int i = 0; i < HALO; i++)
        {
            for (int j = 0; j < smColDim; j++)
            {
                indexTopHalo = (blockIdx.x * blockDim.x * TILE_SIZE + i) * N + (blockIdx.y * blockDim.y * TILE_SIZE) + j;
                indexBottomHalo = (HALO + (blockIdx.x + 1) * blockDim.x * TILE_SIZE) * N + (blockIdx.y * blockDim.y * TILE_SIZE) + j;
                shSrc[i * smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[indexBottomHalo];
            }
        }

        // Right and left columns
        for (int i = 0; i < HALO; i++)
        {
            for (int j = 0; j < smRowDim - HALO * 2; j++)
            {
                indexLeftHalo = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + (blockIdx.y * blockDim.y * TILE_SIZE) + i;
                indexRightHalo = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + ((blockIdx.y + 1) * blockDim.y * TILE_SIZE) + HALO + i;
                shSrc[(HALO + j) * smColDim + i] = src[indexLeftHalo];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[indexRightHalo];
            }
        }
    }

    __syncthreads();

    // Compute stencil
    for (int i = 0; i < TILE_SIZE; i++)
    {
        for (int j = 0; j < TILE_SIZE; j++)
        {
            int globalIndex = baseColIndex + i * N + baseRowIndex + j;
            int shMemIndex = HALO * smColDim + threadIdx.x * smColDim * TILE_SIZE + i * smColDim + HALO + threadIdx.y * TILE_SIZE + j;

            // Getting the neighbors
            north = shSrc[shMemIndex - smColDim];
            south = shSrc[shMemIndex + smColDim];
            east  = shSrc[shMemIndex + 1];
            west  = shSrc[shMemIndex - 1];

            // Real Stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }
}