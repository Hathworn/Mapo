#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function optimized for memory access
__global__ void gpu_stencil2D_4pt(double *dst, double *src, int M, int N) {
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double *shSrc = shared_mem;

    // indexes
    int i, j;

    // neighbor's values
    double north, south, east, west;

    // SharedMem Columns Dimension
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Calculate global and shared indices
    int blockOffsetX = blockIdx.x * blockDim.x * TILE_SIZE;
    int blockOffsetY = blockIdx.y * blockDim.y * TILE_SIZE;
    int threadOffsetX = threadIdx.x * TILE_SIZE;
    int threadOffsetY = threadIdx.y * TILE_SIZE;
    int baseGlobalIndex = HALO * N + blockOffsetX * N + blockOffsetY;
    int baseShMemIndex = HALO * smColDim + threadOffsetX * smColDim + HALO + threadOffsetY;

    // Copying to shared memory (Inner part)
    for (i = 0; i < TILE_SIZE; i++) {
        for (j = 0; j < TILE_SIZE; j++) {
            int globalIndex = baseGlobalIndex + threadOffsetX * N + i * N + threadOffsetY + j;
            int shMemIndex = baseShMemIndex + i * smColDim + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Synchronize threads before halo data read
    __syncthreads();

    // Halos (optimized halo copying)
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        int indexTopHalo, indexBottomHalo, indexLeftHalo, indexRightHalo;
        // For Bottom and top row
        for (i = 0; i < HALO; i++) {
            for (j = 0; j < smColDim; j++) {
                indexTopHalo = blockOffsetX * N + i * N + blockOffsetY + j;
                indexBottomHalo = (HALO + blockOffsetX + blockDim.x * TILE_SIZE) * N + blockOffsetY + j;
                shSrc[i * smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[indexBottomHalo];
            }
        }
        // For right and left Columns
        for (i = 0; i < HALO; i++) {
            for (j = 0; j < smRowDim - HALO * 2; j++) {
                indexLeftHalo = (HALO + blockOffsetX + j) * N + blockOffsetY + i;
                indexRightHalo = (HALO + blockOffsetX + j) * N + ((blockIdx.y + 1) * blockDim.y * TILE_SIZE) + HALO + i;
                shSrc[(HALO + j) * smColDim + i] = src[indexLeftHalo];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[indexRightHalo];
            }
        }
    }

    // Synchronize threads to ensure halo data is copied
    __syncthreads();

    // Compute the stencil operation
    for (i = 0; i < TILE_SIZE; i++) {
        for (j = 0; j < TILE_SIZE; j++) {
            int globalIndex = baseGlobalIndex + threadOffsetX * N + i * N + threadOffsetY + j;
            int shMemIndex = baseShMemIndex + i * smColDim + j;
            // Getting the neighbors
            north = shSrc[shMemIndex - smColDim];
            south = shSrc[shMemIndex + smColDim];
            east = shSrc[shMemIndex + 1];
            west = shSrc[shMemIndex - 1];
            // Real Stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }
    
    // Final synchronization
    __syncthreads();
}