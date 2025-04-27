#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declaring shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // Calculate shared memory dimensions
    int smColDim = HALO*2+blockDim.y*TILE_SIZE;
    int smRowDim = HALO*2+blockDim.x*TILE_SIZE;

    // Calculate global indices
    int globalStartX = blockIdx.x*blockDim.x*TILE_SIZE + threadIdx.x*TILE_SIZE;
    int globalStartY = blockIdx.y*blockDim.y*TILE_SIZE + threadIdx.y*TILE_SIZE;

    // Load inner part into shared memory
    for (int i = 0; i < TILE_SIZE; i++) 
    {
        for (int j = 0; j < TILE_SIZE; j++) 
        {
            int globalIndex = HALO*N + globalStartX*N + i*N + globalStartY + j + HALO;
            int shMemIndex = HALO*smColDim + threadIdx.x*smColDim*TILE_SIZE + i*smColDim + HALO + threadIdx.y*TILE_SIZE + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }
    __syncthreads();

    // Load halos into shared memory
    if (threadIdx.x == 0 && threadIdx.y == 0) 
    {
        for (int i = 0; i < HALO; i++) 
        {
            for (int j = 0; j < smColDim; j++) 
            {
                int indexTopHalo = (blockIdx.x*blockDim.x*TILE_SIZE + i)*N + (blockIdx.y*blockDim.y*TILE_SIZE) + j;
                int indexBottomHalo = (HALO + (blockIdx.x+1)*blockDim.x*TILE_SIZE)*N + (blockIdx.y*blockDim.y*TILE_SIZE) + j;
                shSrc[i*smColDim+j] = src[indexTopHalo];
                shSrc[(HALO+blockDim.x*TILE_SIZE+i)*smColDim + j] = src[indexBottomHalo];
            }
        }
        
        for (int i = 0; i < HALO; i++) 
        {
            for (int j = 0; j < smRowDim-HALO*2; j++) 
            {
                int indexLeftHalo = (HALO+blockIdx.x*blockDim.x*TILE_SIZE+j)*N + (blockIdx.y*blockDim.y*TILE_SIZE) + i;
                int indexRightHalo = (HALO+blockIdx.x*blockDim.x*TILE_SIZE+j)*N + ((blockIdx.y+1)*blockDim.y*TILE_SIZE) + HALO + i;
                shSrc[(HALO+j)*smColDim+i] = src[indexLeftHalo];
                shSrc[(HALO+j+1)*smColDim-HALO+i] = src[indexRightHalo];
            }
        }
    }
    __syncthreads();

    // Perform stencil operation
    for (int i = 0; i < TILE_SIZE; i++) 
    {
        for (int j = 0; j < TILE_SIZE; j++) 
        {
            int globalIndex = HALO*N + globalStartX*N + i*N + globalStartY + j + HALO;
            int shMemIndex = HALO*smColDim + threadIdx.x*smColDim*TILE_SIZE + i*smColDim + HALO + threadIdx.y*TILE_SIZE + j;

            // Read neighbors
            double north = shSrc[shMemIndex-smColDim];
            double south = shSrc[shMemIndex+smColDim];
            double east  = shSrc[shMemIndex+1];
            double west  = shSrc[shMemIndex-1];

            // Real stencil operation
            dst[globalIndex] = (north + south + east + west)/5.5;
        }
    }
}