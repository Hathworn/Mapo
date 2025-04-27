#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // Global thread coordinates
    int baseX = blockIdx.x * blockDim.x * TILE_SIZE + threadIdx.x * TILE_SIZE;
    int baseY = blockIdx.y * blockDim.y * TILE_SIZE + threadIdx.y * TILE_SIZE;

    // SharedMem extent
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Linearize indices
    int linearBlock = blockIdx.x * blockDim.x * TILE_SIZE * N + blockIdx.y * blockDim.y * TILE_SIZE;
    int linearThread = threadIdx.x * TILE_SIZE * N + threadIdx.y * TILE_SIZE;

    // Load inner elements into shared memory
    for (int i = 0; i < TILE_SIZE; i++)
    {
        for (int j = 0; j < TILE_SIZE; j++)
        {
            int globalIndex = HALO * N + linearBlock + linearThread + i * N + j + HALO;
            int shMemIndex = HALO * smColDim + threadIdx.x * smColDim * TILE_SIZE + i * smColDim + HALO + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Load halos (top, bottom, left, right) into shared memory
    if (threadIdx.x == 0 && threadIdx.y == 0)
    {
        // Top and bottom rows
        for (int i = 0; i < HALO; i++)
        {
            for (int j = 0; j < smColDim; j++)
            {
                int indexTopHalo = (blockIdx.x * blockDim.x * TILE_SIZE + i) * N + blockIdx.y * blockDim.y * TILE_SIZE + j;
                int indexBottomHalo = (HALO + (blockIdx.x + 1) * blockDim.x * TILE_SIZE) * N + blockIdx.y * blockDim.y * TILE_SIZE + j;
                shSrc[i * smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[indexBottomHalo];
            }
        }

        // Left and right columns
        for (int i = 0; i < HALO; i++)
        {
            for (int j = 0; j < smRowDim - HALO * 2; j++)
            {
                int indexLeftHalo = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + blockIdx.y * blockDim.y * TILE_SIZE + i;
                int indexRightHalo = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + ((blockIdx.y + 1) * blockDim.y * TILE_SIZE) + HALO + i;
                shSrc[(HALO + j) * smColDim + i] = src[indexLeftHalo];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[indexRightHalo];
            }
        }
    }

    __syncthreads();

    // Perform stencil computation
    for (int i = 0; i < TILE_SIZE; i++)
    {
        for (int j = 0; j < TILE_SIZE; j++)
        {
            int globalIndex = HALO * N + linearBlock + linearThread + i * N + j + HALO;
            int shMemIndex = HALO * smColDim + threadIdx.x * smColDim * TILE_SIZE + i * smColDim + HALO + j;

            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east  = shSrc[shMemIndex + 1];
            double west  = shSrc[shMemIndex - 1];

            // Real Stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }

    __syncthreads();
}