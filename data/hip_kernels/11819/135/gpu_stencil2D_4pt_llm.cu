#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // indexes
    int i, j;

    // neighbor's values
    double north, south, east, west;

    // SharedMem Columns Dimension
    int smColDim = HALO*2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO*2 + blockDim.x * TILE_SIZE;

    // Copying to shared memory
    // Inner part - optimized memory access pattern
    int baseGlobalIndex = HALO*N + blockIdx.x * blockDim.x * TILE_SIZE * N + blockIdx.y * blockDim.y * TILE_SIZE + HALO;
    int baseShMemIndex = HALO * smColDim + HALO;
    
    for (i = 0; i < TILE_SIZE; i++) {
        for (j = 0; j < TILE_SIZE; j++) {
            int globalIndex = baseGlobalIndex + threadIdx.x * TILE_SIZE * N + i * N + threadIdx.y * TILE_SIZE + j;
            int shMemIndex = baseShMemIndex + threadIdx.x * smColDim * TILE_SIZE + i * smColDim + threadIdx.y * TILE_SIZE + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Halos - streamlined logic using optimized thread control
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        int indexTopHalo, indexBottomHalo, indexLeftHalo, indexRightHalo;

        // For Bottom and top row
        for (i = 0; i < HALO; i++) {
            int baseHaloRowGlobalIndex = blockIdx.x * blockDim.x * TILE_SIZE * N + blockIdx.y * blockDim.y * TILE_SIZE;
            for (j = 0; j < smColDim; j++) {
                indexTopHalo = baseHaloRowGlobalIndex + i * N + j;
                indexBottomHalo = baseGlobalIndex + (HALO + blockDim.x * TILE_SIZE + i) * N + j;
                shSrc[i * smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[indexBottomHalo];
            }
        }

        // For right and left Columns
        for (j = 0; j < smRowDim - HALO * 2; j++) {
            int baseHaloColGlobalIndex = HALO + blockIdx.x * blockDim.x * TILE_SIZE + j;
            indexLeftHalo = baseHaloColGlobalIndex * N + blockIdx.y * blockDim.y * TILE_SIZE;
            indexRightHalo = baseHaloColGlobalIndex * N + (blockIdx.y + 1) * blockDim.y * TILE_SIZE + HALO;
            shSrc[(HALO + j) * smColDim] = src[indexLeftHalo];
            shSrc[(HALO + j + 1) * smColDim - HALO] = src[indexRightHalo];
        }
    }

    __syncthreads();

    // Process stencil operation
    for (i = 0; i < TILE_SIZE; i++) {
        for (j = 0; j < TILE_SIZE; j++) {
            int globalIndex = baseGlobalIndex + threadIdx.x * TILE_SIZE * N + i * N + threadIdx.y * TILE_SIZE + j;
            int shMemIndex = baseShMemIndex + threadIdx.x * smColDim * TILE_SIZE + i * smColDim + threadIdx.y * TILE_SIZE + j;

            // Getting the neighbors
            north = shSrc[shMemIndex - smColDim];
            south = shSrc[shMemIndex + smColDim];
            east = shSrc[shMemIndex + 1];
            west = shSrc[shMemIndex - 1];

            // Real Stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }

    __syncthreads();
}