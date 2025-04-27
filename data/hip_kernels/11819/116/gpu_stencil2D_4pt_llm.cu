#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double *dst, double *src, int M, int N) {
    // Using external shared memory
    extern __shared__ double shared_mem[];
    double *shSrc = shared_mem;

    // Calculate thread indices and shared memory dimensions
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int blockStartIdxX = blockIdx.x * blockDim.x * TILE_SIZE;
    int blockStartIdxY = blockIdx.y * blockDim.y * TILE_SIZE;
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Calculate global and shared memory indices
    int globalBaseIndex = HALO * N + blockStartIdxX * N + blockStartIdxY + HALO;
    int shBaseIndex = HALO * smColDim + HALO;

    // Load inner tile into shared memory
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = globalBaseIndex + tx * TILE_SIZE * N + ty * TILE_SIZE + i * N + j;
            int shMemIndex = shBaseIndex + tx * smColDim * TILE_SIZE + ty * TILE_SIZE + i * smColDim + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Load halo regions into shared memory: executed by a single thread
    if (tx == 0 && ty == 0) {
        int index;
        for (int i = 0; i < HALO; i++) {
            for (int j = 0; j < smColDim; j++) {
                index = (blockStartIdxX + i) * N + blockStartIdxY + j;
                shSrc[i * smColDim + j] = src[index];
                index = (HALO + blockStartIdxX + blockDim.x * TILE_SIZE + i) * N + blockStartIdxY + j;
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[index];
            }
        }
        for (int i = 0; i < HALO; i++) {
            for (int j = 0; j < smRowDim - HALO * 2; j++) {
                index = (HALO + blockStartIdxX + j) * N + blockStartIdxY + i;
                shSrc[(HALO + j) * smColDim + i] = src[index];
                index = (HALO + blockStartIdxX + j) * N + ((blockIdx.y + 1) * blockDim.y * TILE_SIZE) + HALO + i;
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[index];
            }
        }
    }

    __syncthreads();

    // Compute the stencil operation for each inner element
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = globalBaseIndex + tx * TILE_SIZE * N + ty * TILE_SIZE + i * N + j;
            int shMemIndex = shBaseIndex + tx * smColDim * TILE_SIZE + ty * TILE_SIZE + i * smColDim + j;
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east  = shSrc[shMemIndex + 1];
            double west  = shSrc[shMemIndex - 1];
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }

    __syncthreads();
}