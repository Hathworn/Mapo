#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double *dst, double *src, int M, int N) {
    // Declare the shared memory array for source
    extern __shared__ double shared_mem[];
    double *shSrc = shared_mem;

    // Indexes
    int i, j;

    // Neighbor's values
    double north, south, east, west;

    // SharedMem Columns Dimension
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Thread indexes
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Block indexes
    int bx = blockIdx.x * blockDim.x;
    int by = blockIdx.y * blockDim.y;

    // Copying to shared memory: Inner part
    int globalIndex, shMemIndex;

    for (i = 0; i < TILE_SIZE; i++) {
        for (j = 0; j < TILE_SIZE; j++) {
            globalIndex = HALO * N + bx * TILE_SIZE * N + tx * TILE_SIZE * N + i * N + by * TILE_SIZE + ty * TILE_SIZE + j + HALO;
            shMemIndex = HALO * smColDim + tx * smColDim * TILE_SIZE + i * smColDim + HALO + ty * TILE_SIZE + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Halos
    if (tx == 0 && ty == 0) {
        int indexTopHalo, indexBottomHalo, indexLeftHalo, indexRightHalo;

        // For Bottom and top row
        for (i = 0; i < HALO; i++) {
            for (j = 0; j < smColDim; j++) {
                indexTopHalo = (bx * TILE_SIZE + i) * N + by * TILE_SIZE + j;
                indexBottomHalo = (HALO + (bx + 1) * TILE_SIZE) * N + by * TILE_SIZE + j;
                shSrc[i * smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[indexBottomHalo];
            }
        }

        // For right and left columns
        for (i = 0; i < HALO; i++) {
            for (j = 0; j < smRowDim - HALO * 2; j++) {
                indexLeftHalo = (HALO + bx * TILE_SIZE + j) * N + by * TILE_SIZE + i;
                indexRightHalo = (HALO + bx * TILE_SIZE + j) * N + ((by + 1) * TILE_SIZE) + HALO + i;
                shSrc[(HALO + j) * smColDim + i] = src[indexLeftHalo];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[indexRightHalo];
            }
        }
    }

    __syncthreads();

    // Stencil computation
    for (i = 0; i < TILE_SIZE; i++) {
        for (j = 0; j < TILE_SIZE; j++) {
            globalIndex = HALO * N + bx * TILE_SIZE * N + tx * TILE_SIZE * N + i * N + by * TILE_SIZE + ty * TILE_SIZE + j + HALO;
            shMemIndex = HALO * smColDim + tx * smColDim * TILE_SIZE + i * smColDim + HALO + ty * TILE_SIZE + j;

            // Getting the neighbors
            north = shSrc[shMemIndex - smColDim];
            south = shSrc[shMemIndex + smColDim];
            east  = shSrc[shMemIndex + 1];
            west  = shSrc[shMemIndex - 1];

            // Real Stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }

    __syncthreads();
}