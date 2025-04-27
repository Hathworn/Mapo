#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declaring shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // SharedMem Column Dimension
    int smColDim = HALO*2 + blockDim.y*TILE_SIZE;
    int smRowDim = HALO*2 + blockDim.x*TILE_SIZE;

    // Calculate blockIndices for halo loading only once
    int blockXOffset = blockIdx.x*blockDim.x*TILE_SIZE;
    int blockYOffset = blockIdx.y*blockDim.y*TILE_SIZE;

    // Copying to shared memory - Inner part
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    for (int i = 0; i < TILE_SIZE; i++)
    {
        for (int j = 0; j < TILE_SIZE; j++)
        {
            int globalIndex = HALO*N + blockXOffset*N + tx*TILE_SIZE*N + i*N + blockYOffset + ty*TILE_SIZE + j + HALO;
            int shMemIndex = HALO*smColDim + tx*smColDim*TILE_SIZE + i*smColDim + HALO + ty*TILE_SIZE + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Synchronizing threads before halo copy
    __syncthreads();

    // Load halo only if necessary
    if (tx == 0 && ty == 0)
    {
        int indexTopHalo, indexBottomHalo, indexLeftHalo, indexRightHalo;
        
        // Halo loading - Top and Bottom rows
        for (int i = 0; i < HALO; i++)
        {
            for (int j = 0; j < smColDim; j++)
            {
                indexTopHalo = (blockXOffset + i)*N + blockYOffset + j;
                indexBottomHalo = (HALO + blockXOffset + blockDim.x*TILE_SIZE)*N + blockYOffset + j;
                shSrc[i*smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + blockDim.x*TILE_SIZE + i)*smColDim + j] = src[indexBottomHalo];
            }
        }

        // Halo loading - Left and Right Columns
        for (int i = 0; i < HALO; i++)
        {
            for (int j = 0; j < smRowDim - HALO*2; j++)
            {
                indexLeftHalo = (HALO + blockXOffset + j)*N + blockYOffset + i;
                indexRightHalo = (HALO + blockXOffset + j)*N + ((blockIdx.y + 1) * blockDim.y * TILE_SIZE) + HALO + i;
                shSrc[(HALO + j)*smColDim + i] = src[indexLeftHalo];
                shSrc[(HALO + j + 1)*smColDim - HALO + i] = src[indexRightHalo];
            }
        }
    }

    // Synchronizing threads after halo copy
    __syncthreads();

    // Stencil operation on shared memory
    for (int i = 0; i < TILE_SIZE; i++)
    {
        for (int j = 0; j < TILE_SIZE; j++)
        {
            int globalIndex = HALO*N + blockXOffset*N + tx*TILE_SIZE*N + i*N + blockYOffset + ty*TILE_SIZE + j + HALO;
            int shMemIndex = HALO*smColDim + tx*smColDim*TILE_SIZE + i*smColDim + HALO + ty*TILE_SIZE + j;

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