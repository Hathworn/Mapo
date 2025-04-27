#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declare shared memory
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // Determine shared memory dimensions
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Calculate global indices for each thread
    int baseI = HALO * N + blockIdx.x * blockDim.x * TILE_SIZE * N + threadIdx.x * TILE_SIZE * N + blockIdx.y * blockDim.y * TILE_SIZE + threadIdx.y * TILE_SIZE + HALO;
    int baseShIndex = HALO * smColDim + threadIdx.x * smColDim * TILE_SIZE + HALO + threadIdx.y * TILE_SIZE;

    // Load the inner tile into shared memory
    for (int i = 0; i < TILE_SIZE; ++i) 
    {
        for (int j = 0; j < TILE_SIZE; ++j) 
        {
            int globalIndex = baseI + i * N + j;
            int shMemIndex = baseShIndex + i * smColDim + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Synchronize to ensure complete tile loading
    __syncthreads();

    // Load halo only if one thread performs this operation
    if (threadIdx.x == 0 && threadIdx.y == 0) 
    {
        int index, haloIndex;

        // Top and bottom halos
        for (int i = 0; i < HALO; ++i) 
        {
            for (int j = 0; j < smColDim; ++j) 
            {
                index = (blockIdx.x * blockDim.x * TILE_SIZE + i) * N + blockIdx.y * blockDim.y * TILE_SIZE + j;
                haloIndex = i * smColDim + j;
                shSrc[haloIndex] = src[index];

                index = (HALO + (blockIdx.x + 1) * blockDim.x * TILE_SIZE) * N + blockIdx.y * blockDim.y * TILE_SIZE + j;
                haloIndex = (HALO + blockDim.x * TILE_SIZE + i) * smColDim + j;
                shSrc[haloIndex] = src[index];
            }
        }

        // Left and right halos
        for (int j = 0; j < smRowDim - HALO * 2; ++j) 
        {
            for (int i = 0; i < HALO; ++i) 
            {
                index = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + blockIdx.y * blockDim.y * TILE_SIZE + i;
                haloIndex = (HALO + j) * smColDim + i;
                shSrc[haloIndex] = src[index];

                index = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + ((blockIdx.y + 1) * blockDim.y * TILE_SIZE) + HALO + i;
                haloIndex = (HALO + j + 1) * smColDim - HALO + i;
                shSrc[haloIndex] = src[index];
            }
        }
    }

    // Synchronize to ensure halo loading
    __syncthreads();

    // Perform stencil computation
    for (int i = 0; i < TILE_SIZE; ++i) 
    {
        for (int j = 0; j < TILE_SIZE; ++j) 
        {
            int globalIndex = baseI + i * N + j;
            int shMemIndex = baseShIndex + i * smColDim + j;

            // Retrieve neighbors
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east = shSrc[shMemIndex + 1];
            double west = shSrc[shMemIndex - 1];

            // Apply stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }

    // Synchronize at end of kernel
    __syncthreads();
}