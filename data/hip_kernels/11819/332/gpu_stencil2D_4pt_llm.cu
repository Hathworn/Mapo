#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double *dst, double *src, int M, int N) {
    // Declare shared memory for source
    extern __shared__ double shared_mem[];
    double *shSrc = shared_mem;

    // Thread and Block index
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int bx = blockIdx.x;
    int by = blockIdx.y;

    // Define shared memory dimensions
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Calculate global and shared memory indices for copying to shared memory
    int globalStartIndex = HALO * N + bx * blockDim.x * TILE_SIZE * N + tx * TILE_SIZE * N + by * blockDim.y * TILE_SIZE + ty * TILE_SIZE + HALO;
    int shMemStartIndex = HALO * smColDim + tx * smColDim * TILE_SIZE + HALO + ty * TILE_SIZE;

    // Copy to shared memory - Inner part
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            shSrc[shMemStartIndex + i * smColDim + j] = src[globalStartIndex + i * N + j];
        }
    }

    // Handle Halos
    if (tx == 0 && ty == 0) {
        int indexTopHalo, indexBottomHalo, indexLeftHalo, indexRightHalo;
        // Top and bottom rows
        for (int i = 0; i < HALO; i++) {
            for (int j = 0; j < smColDim; j++) {
                indexTopHalo = (bx * blockDim.x * TILE_SIZE + i) * N + by * blockDim.y * TILE_SIZE + j;
                indexBottomHalo = (HALO + (bx + 1) * blockDim.x * TILE_SIZE) * N + by * blockDim.y * TILE_SIZE + j;
                shSrc[i * smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[indexBottomHalo];
            }
        }
        // Left and right columns
        for (int i = 0; i < HALO; i++) {
            for (int j = 0; j < smRowDim - HALO * 2; j++) {
                indexLeftHalo = (HALO + bx * blockDim.x * TILE_SIZE + j) * N + by * blockDim.y * TILE_SIZE + i;
                indexRightHalo = (HALO + bx * blockDim.x * TILE_SIZE + j) * N + (by + 1) * blockDim.y * TILE_SIZE + HALO + i;
                shSrc[(HALO + j) * smColDim + i] = src[indexLeftHalo];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[indexRightHalo];
            }
        }
    }

    __syncthreads();

    // Perform stencil operation
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            int shMemIndex = shMemStartIndex + i * smColDim + j;

            // Load neighbor values
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east = shSrc[shMemIndex + 1];
            double west = shSrc[shMemIndex - 1];

            // Compute stencil result
            dst[globalStartIndex + i * N + j] = (north + south + east + west) / 5.5;
        }
    }
}