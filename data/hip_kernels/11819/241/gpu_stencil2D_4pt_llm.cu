```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declare shared memory for source
    extern __shared__ double shared_mem[];
    double *shSrc = shared_mem;

    // Local thread coordinates
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Shared memory dimensions
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Coordinates for global memory access
    int baseGlobalIndex = HALO * N + blockIdx.x * blockDim.x * TILE_SIZE * N + blockIdx.y * blockDim.y * TILE_SIZE;
    int shMemBaseIndex = HALO * smColDim + tx * smColDim * TILE_SIZE + HALO + ty * TILE_SIZE;

    // Copy inner part to shared memory
    for (int i = 0; i < TILE_SIZE; i++)
    {
        for (int j = 0; j < TILE_SIZE; j++)
        {
            int globalIndex = baseGlobalIndex + tx * TILE_SIZE * N + i * N + ty * TILE_SIZE + j;
            int shMemIndex = shMemBaseIndex + i * smColDim + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Copy halos to shared memory (only by thread (0, 0) to avoid redundancy)
    if (tx == 0 && ty == 0)
    {
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

    // Compute stencil operation
    for (int i = 0; i < TILE_SIZE; i++)
    {
        for (int j = 0; j < TILE_SIZE; j++)
        {
            int globalIndex = baseGlobalIndex + tx * TILE_SIZE * N + i * N + ty * TILE_SIZE + j;
            int shMemIndex = shMemBaseIndex + i * smColDim + j;

            // Get neighboring values
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east  = shSrc[shMemIndex + 1];
            double west  = shSrc[shMemIndex - 1];

            // Stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }

    __syncthreads();
}