#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double *dst, double *src, int M, int N) {
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double *shSrc = shared_mem;

    // SharedMem Columns and Rows Dimension
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Initialize thread shared memory copy positions
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int bx = blockIdx.x;
    int by = blockIdx.y;

    // Global and shared memory indices
    int globalIndex, shMemIndex;

    // Copying to shared memory: Inner part
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            globalIndex = HALO * N + bx * blockDim.x * TILE_SIZE * N + tx * TILE_SIZE * N + i * N + by * blockDim.y * TILE_SIZE + ty * TILE_SIZE + j + HALO;
            shMemIndex = HALO * smColDim + tx * smColDim * TILE_SIZE + i * smColDim + HALO + ty * TILE_SIZE + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    __syncthreads();

    // Halos: Copying Top, Bottom, Left and Right halos by a single thread for efficiency
    if (tx == 0 && ty == 0) {
        int indexTopHalo, indexBottomHalo, indexLeftHalo, indexRightHalo;

        // Top and Bottom rows
        for (int i = 0; i < HALO; i++) {
            for (int j = 0; j < smColDim; j++) {
                indexTopHalo = (bx * blockDim.x * TILE_SIZE + i) * N + (by * blockDim.y * TILE_SIZE) + j;
                indexBottomHalo = (HALO + (bx + 1) * blockDim.x * TILE_SIZE) * N + (by * blockDim.y * TILE_SIZE) + j;
                shSrc[i * smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[indexBottomHalo];
            }
        }

        // Left and Right columns
        for (int j = 0; j < smRowDim - HALO * 2; j++) {
            for (int i = 0; i < HALO; i++) {
                indexLeftHalo = (HALO + bx * blockDim.x * TILE_SIZE + j) * N + (by * blockDim.y * TILE_SIZE) + i;
                indexRightHalo = (HALO + bx * blockDim.x * TILE_SIZE + j) * N + ((by + 1) * blockDim.y * TILE_SIZE) + HALO + i;
                shSrc[(HALO + j) * smColDim + i] = src[indexLeftHalo];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[indexRightHalo];
            }
        }
    }

    __syncthreads();

    // Stencil operation
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            globalIndex = HALO * N + bx * blockDim.x * TILE_SIZE * N + tx * TILE_SIZE * N + i * N + by * blockDim.y * TILE_SIZE + ty * TILE_SIZE + j + HALO;
            shMemIndex = HALO * smColDim + tx * smColDim * TILE_SIZE + i * smColDim + HALO + ty * TILE_SIZE + j;

            // Getting the neighbors
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east = shSrc[shMemIndex + 1];
            double west = shSrc[shMemIndex - 1];

            // Real Stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }
}