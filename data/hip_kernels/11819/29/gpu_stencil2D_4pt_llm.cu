#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // SharedMem Columns Dimension
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Thread indices
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Calculate base global and shared memory indices
    int base_global_idx = HALO * N + blockIdx.x * blockDim.x * TILE_SIZE * N + tx * TILE_SIZE * N + blockIdx.y * blockDim.y * TILE_SIZE + ty * TILE_SIZE + HALO;
    int base_shared_idx = HALO * smColDim + tx * smColDim * TILE_SIZE + HALO + ty * TILE_SIZE;

    // Copying to shared memory - Inner part
    #pragma unroll
    for (int i = 0; i < TILE_SIZE; i++)
    {
        #pragma unroll
        for (int j = 0; j < TILE_SIZE; j++)
        {
            int globalIndex = base_global_idx + i * N + j;
            int shMemIndex = base_shared_idx + i * smColDim + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Halos
    if (tx == 0 && ty == 0)
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

    __syncthreads();

    // Stencil operation
    #pragma unroll
    for (int i = 0; i < TILE_SIZE; i++)
    {
        #pragma unroll
        for (int j = 0; j < TILE_SIZE; j++)
        {
            int globalIndex = base_global_idx + i * N + j;
            int shMemIndex = base_shared_idx + i * smColDim + j;

            // Get neighbor values
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east  = shSrc[shMemIndex + 1];
            double west  = shSrc[shMemIndex - 1];

            // Real Stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }
}