#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N) {
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // indexes
    int i, j;

    // neighbor's values
    double north, south, east, west;

    // SharedMem Columns Dimension
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Local thread indices
    int local_i = threadIdx.x * TILE_SIZE;
    int local_j = threadIdx.y * TILE_SIZE;

    // Global indices
    int base_i = blockIdx.x * blockDim.x * TILE_SIZE + local_i + HALO;
    int base_j = blockIdx.y * blockDim.y * TILE_SIZE + local_j + HALO;

    // Copying to shared memory - Inner part
    for (i = 0; i < TILE_SIZE; i++) {
        for (j = 0; j < TILE_SIZE; j++) {
            int globalIndex = (base_i + i) * N + (base_j + j);
            int shMemIndex = (local_i + i + HALO) * smColDim + local_j + j + HALO;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    __syncthreads();

    // Only the first thread in the block handles the halo
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        // Handling Halos
        int indexTopHalo, indexBottomHalo, indexLeftHalo, indexRightHalo;

        // For Bottom and top row
        for (i = 0; i < HALO; i++) {
            for (j = 0; j < smColDim; j++) {
                indexTopHalo = (blockIdx.x * blockDim.x * TILE_SIZE + i) * N + blockIdx.y * blockDim.y * TILE_SIZE + j;
                indexBottomHalo = (HALO + (blockIdx.x + 1) * blockDim.x * TILE_SIZE) * N + blockIdx.y * blockDim.y * TILE_SIZE + j;
                shSrc[i * smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[indexBottomHalo];
            }
        }

        // For right and left Columns
        for (i = 0; i < HALO; i++) {
            for (j = 0; j < smRowDim - HALO * 2; j++) {
                indexLeftHalo = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + blockIdx.y * blockDim.y * TILE_SIZE + i;
                indexRightHalo = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + ((blockIdx.y + 1) * blockDim.y * TILE_SIZE) + HALO + i;
                shSrc[(HALO + j) * smColDim + i] = src[indexLeftHalo];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[indexRightHalo];
            }
        }
    }

    __syncthreads();

    // Compute the stencil operation
    for (i = 0; i < TILE_SIZE; i++) {
        for (j = 0; j < TILE_SIZE; j++) {
            int globalIndex = (base_i + i) * N + (base_j + j);
            int shMemIndex = (local_i + i + HALO) * smColDim + local_j + j + HALO;

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