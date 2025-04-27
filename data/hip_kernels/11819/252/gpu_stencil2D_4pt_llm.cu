#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double *dst, double *src, int M, int N)
{
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double *shSrc = shared_mem;

    // SharedMem Columns Dimension
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Calculate global indices
    int base_global_i = HALO * N + blockIdx.x * blockDim.x * TILE_SIZE * N;
    int base_global_j = HALO + blockIdx.y * blockDim.y * TILE_SIZE;
    int base_sh_i = HALO * smColDim + threadIdx.x * smColDim * TILE_SIZE;
    int base_sh_j = HALO + threadIdx.y * TILE_SIZE;

    // Calculate thread indices for the shared memory
    int thread_i = threadIdx.x * TILE_SIZE;
    int thread_j = threadIdx.y * TILE_SIZE;

    // Initialize shared memory with src values
    for (int i = 0; i < TILE_SIZE; i++)
    {
        for (int j = 0; j < TILE_SIZE; j++)
        {
            int globalIndex = base_global_i + thread_i * N + i * N + base_global_j + thread_j + j;
            int shMemIndex = base_sh_i + thread_i * smColDim + i * smColDim + base_sh_j + thread_j + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    __syncthreads(); // Sync threads after loading into shared memory

    // Load halos into shared memory
    if (threadIdx.x == 0 && threadIdx.y == 0)
    {
        int indexTopHalo, indexBottomHalo, indexLeftHalo, indexRightHalo;
        // For Bottom and top row
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

        // For right and left Columns
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

    __syncthreads(); // Ensure all threads have completed halo loading

    // Perform stencil operations
    for (int i = 0; i < TILE_SIZE; i++)
    {
        for (int j = 0; j < TILE_SIZE; j++)
        {
            int globalIndex = base_global_i + thread_i * N + i * N + base_global_j + thread_j + j;
            int shMemIndex = base_sh_i + thread_i * smColDim + i * smColDim + base_sh_j + thread_j + j;

            // Getting the neighbors
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east = shSrc[shMemIndex + 1];
            double west = shSrc[shMemIndex - 1];
            
            // Real Stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }
}