#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // SharedMem Collumns Dimension
    int smColDim = HALO*2 + blockDim.y*TILE_SIZE;
    int smRowDim = HALO*2 + blockDim.x*TILE_SIZE;

    // Global Index Calculations
    int globalBaseIndex = HALO*N + blockIdx.x*blockDim.x*TILE_SIZE*N + blockIdx.y*blockDim.y*TILE_SIZE + HALO;
    int localRowIndex = HALO*smColDim + threadIdx.x*smColDim*TILE_SIZE;
    int localColIndex = HALO + threadIdx.y*TILE_SIZE;

    // Optimized copying to shared memory
    for (int i = 0; i < TILE_SIZE; i++)
    {
        int rowBaseIdx = localRowIndex + i*smColDim;
        int globalOffset = globalBaseIndex + threadIdx.x*TILE_SIZE*N + i*N;

        for (int j = 0; j < TILE_SIZE; j++)
        {
            int globalIndex = globalOffset + threadIdx.y*TILE_SIZE + j;
            int shMemIndex = rowBaseIdx + localColIndex + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Shared threads sync for halo copying 
    __syncthreads();

    // Efficient halo copying using conditionals inside shared memory
    if (threadIdx.x == 0 && threadIdx.y == 0)
    {
        for (int i = 0; i < HALO; i++)
        {
            for (int j = 0; j < smColDim; j++)
            {
                int indexTopHalo = (blockIdx.x*blockDim.x*TILE_SIZE + i) * N + (blockIdx.y*blockDim.y*TILE_SIZE) + j;
                int indexBottomHalo = (HALO + (blockIdx.x+1)*blockDim.x*TILE_SIZE)*N + (blockIdx.y*blockDim.y*TILE_SIZE) + j;

                shSrc[i*smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + blockDim.x*TILE_SIZE + i)*smColDim + j] = src[indexBottomHalo];
            }
        }

        for (int i = 0; i < HALO; i++)
        {
            for (int j = 0; j < smRowDim - HALO*2; j++)
            {
                int indexLeftHalo = (HALO + blockIdx.x*blockDim.x*TILE_SIZE + j) * N + (blockIdx.y*blockDim.y*TILE_SIZE) + i;
                int indexRightHalo = (HALO + blockIdx.x*blockDim.x*TILE_SIZE + j) * N + ((blockIdx.y+1)*blockDim.y*TILE_SIZE) + HALO + i;

                shSrc[(HALO + j)*smColDim + i] = src[indexLeftHalo];
                shSrc[(HALO + j + 1)*smColDim - HALO + i] = src[indexRightHalo];
            }
        }
    }

    // Shared threads sync before stencil calculations
    __syncthreads();

    // Stencil calculation using shared memory
    for (int i = 0; i < TILE_SIZE; i++)
    {
        int rowBaseIdx = localRowIndex + i*smColDim;
        int globalOffset = globalBaseIndex + threadIdx.x*TILE_SIZE*N + i*N;

        for (int j = 0; j < TILE_SIZE; j++)
        {
            int globalIndex = globalOffset + threadIdx.y*TILE_SIZE + j;
            int shMemIndex = rowBaseIdx + localColIndex + j;

            // Getting the neighbors
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east = shSrc[shMemIndex + 1];
            double west = shSrc[shMemIndex - 1];

            // Real Stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }

    // Shared threads sync before finishing kernel
    __syncthreads();
}