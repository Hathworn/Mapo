#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double *shSrc = shared_mem;

    // indexes
    int i, j;

    // neighbor's values
    double north, south, east, west;

    // SharedMem Columns Dimension
    int smColDim = HALO*2 + blockDim.y*TILE_SIZE;
    int smRowDim = HALO*2 + blockDim.x*TILE_SIZE;

    // Copying to shared memory
    int globalIndex, shMemIndex;

    // Copying the inner part
#pragma unroll
    for (i = 0; i < TILE_SIZE; i++) {
        for (j = 0; j < TILE_SIZE; j++) {
            globalIndex = (HALO + blockIdx.x*blockDim.x*TILE_SIZE + threadIdx.x*TILE_SIZE + i)*N 
                        + blockIdx.y*blockDim.y*TILE_SIZE + threadIdx.y*TILE_SIZE + j + HALO;
            shMemIndex = (HALO + threadIdx.x*TILE_SIZE + i)*smColDim 
                       + HALO + threadIdx.y*TILE_SIZE + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Handling halos in parallel using threads
    __syncthreads();
    if (threadIdx.x < HALO) {
        for (j = 0; j < smColDim; j++) {
            // Top halo
            int idxTopHalo = (blockIdx.x*blockDim.x*TILE_SIZE + threadIdx.x)*N 
                           + blockIdx.y*blockDim.y*TILE_SIZE + j;
            shSrc[threadIdx.x*smColDim + j] = src[idxTopHalo];

            // Bottom halo
            int idxBottomHalo = (HALO + (blockIdx.x + 1)*blockDim.x*TILE_SIZE + threadIdx.x)*N 
                              + blockIdx.y*blockDim.y*TILE_SIZE + j;
            shSrc[(HALO + blockDim.x*TILE_SIZE + threadIdx.x)*smColDim + j] = src[idxBottomHalo];
        }
    }

    if (threadIdx.y < HALO) {
        for (i = 0; i < smRowDim; i++) {
            // Left halo
            int idxLeftHalo = (HALO + blockIdx.x*blockDim.x*TILE_SIZE + i)*N 
                            + blockIdx.y*blockDim.y*TILE_SIZE + threadIdx.y;
            shSrc[i*smColDim + threadIdx.y] = src[idxLeftHalo];

            // Right halo
            int idxRightHalo = (HALO + blockIdx.x*blockDim.x*TILE_SIZE + i)*N 
                             + (blockIdx.y + 1)*blockDim.y*TILE_SIZE + HALO + threadIdx.y;
            shSrc[i*smColDim + (HALO + blockDim.y*TILE_SIZE + threadIdx.y)] = src[idxRightHalo];
        }
    }

    __syncthreads();

    // Applying stencil operations
#pragma unroll
    for (i = 0; i < TILE_SIZE; i++) {
        for (j = 0; j < TILE_SIZE; j++) {
            globalIndex = (HALO + blockIdx.x*blockDim.x*TILE_SIZE + threadIdx.x*TILE_SIZE + i)*N 
                        + blockIdx.y*blockDim.y*TILE_SIZE + threadIdx.y*TILE_SIZE + j + HALO;
            shMemIndex = (HALO + threadIdx.x*TILE_SIZE + i)*smColDim 
                       + HALO + threadIdx.y*TILE_SIZE + j;

            north = shSrc[shMemIndex - smColDim];
            south = shSrc[shMemIndex + smColDim];
            east  = shSrc[shMemIndex + 1];
            west  = shSrc[shMemIndex - 1];

            // Real stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }

    __syncthreads();
}