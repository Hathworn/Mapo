#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_DIM_X blockDim.x * TILE_SIZE
#define TILE_DIM_Y blockDim.y * TILE_SIZE

__global__ void gpu_stencil2D_4pt(double *dst, double *src, int M, int N) {
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double *shSrc = shared_mem;

    int smColDim = HALO*2 + TILE_DIM_Y; // SharedMem Columns Dimension
    int smRowDim = HALO*2 + TILE_DIM_X; // SharedMem Rows Dimension

    // Calculate the indices only once for performance improvement
    int baseGlobalIdx = blockIdx.x * TILE_DIM_X * N + blockIdx.y * TILE_DIM_Y;
    int threadGlobalIdx = baseGlobalIdx + threadIdx.x * TILE_SIZE * N + threadIdx.y * TILE_SIZE; 

    int baseShMemIdx = HALO * smColDim + HALO;
    int threadShMemIdx = baseShMemIdx + threadIdx.x * smColDim * TILE_SIZE + threadIdx.y * TILE_SIZE;

    // Copying to shared memory
    // Inner part
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = threadGlobalIdx + i * N + j + HALO * N + HALO;
            int shMemIndex = threadShMemIdx + i * smColDim + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Halo regions copied by a single thread per block
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        for (int i = 0; i < HALO; i++) {
            for (int j = 0; j < smColDim; j++) {
                int indexTopHalo = (blockIdx.x * TILE_DIM_X + i) * N + blockIdx.y * TILE_DIM_Y + j;
                int indexBottomHalo = (HALO + (blockIdx.x + 1) * TILE_DIM_X) * N + blockIdx.y * TILE_DIM_Y + j;
                shSrc[i * smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + TILE_DIM_X + i) * smColDim + j] = src[indexBottomHalo];
            }
        }

        for (int i = 0; i < HALO; i++) {
            for (int j = 0; j < smRowDim - HALO * 2; j++) {
                int indexLeftHalo = (HALO + blockIdx.x * TILE_DIM_X + j) * N + blockIdx.y * TILE_DIM_Y + i;
                int indexRightHalo = (HALO + blockIdx.x * TILE_DIM_X + j) * N + (blockIdx.y + 1) * TILE_DIM_Y + HALO + i;
                shSrc[(HALO + j) * smColDim + i] = src[indexLeftHalo];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[indexRightHalo];
            }
        }
    }

    __syncthreads();

    // Stencil operation
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = threadGlobalIdx + i * N + j + HALO * N + HALO;
            int shMemIndex = threadShMemIdx + i * smColDim + j;

            // Getting the neighbors
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east = shSrc[shMemIndex + 1];
            double west = shSrc[shMemIndex - 1];

            // Real Stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }

    __syncthreads();
}