#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double* dst, double* src, int M, int N) {
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double* shSrc = shared_mem;

    // Compute thread indexes
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int bx = blockIdx.x;
    int by = blockIdx.y;

    // SharedMem dimensions
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Compute global base index from block and thread index
    int baseGlobalIdx = HALO * N + bx * blockDim.x * TILE_SIZE * N + by * blockDim.y * TILE_SIZE;

    // Load inner data to shared memory
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = baseGlobalIdx + tx * TILE_SIZE * N + i * N + ty * TILE_SIZE + j + HALO;
            int shMemIndex = HALO * smColDim + tx * smColDim * TILE_SIZE + i * smColDim + HALO + ty * TILE_SIZE + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Load halo regions to shared memory
    if (tx == 0 && ty == 0) {
        for (int i = 0; i < HALO; i++) {
            for (int j = 0; j < smColDim; j++) {
                int indexTopHalo = bx * blockDim.x * TILE_SIZE * N + i * N + by * blockDim.y * TILE_SIZE + j;
                int indexBottomHalo = (HALO + (bx + 1) * blockDim.x * TILE_SIZE) * N + by * blockDim.y * TILE_SIZE + j;
                shSrc[i * smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[indexBottomHalo];
            }
        }
        for (int i = 0; i < HALO; i++) {
            for (int j = 0; j < smRowDim - HALO * 2; j++) {
                int indexLeftHalo = (HALO + bx * blockDim.x * TILE_SIZE + j) * N + by * blockDim.y * TILE_SIZE + i;
                int indexRightHalo = (HALO + bx * blockDim.x * TILE_SIZE + j) * N + ((by + 1) * blockDim.y * TILE_SIZE) + HALO + i;
                shSrc[(HALO + j) * smColDim + i] = src[indexLeftHalo];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[indexRightHalo];
            }
        }
    }

    __syncthreads();

    // Perform stencil operation
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = baseGlobalIdx + tx * TILE_SIZE * N + i * N + ty * TILE_SIZE + j + HALO;
            int shMemIndex = HALO * smColDim + tx * smColDim * TILE_SIZE + i * smColDim + HALO + ty * TILE_SIZE + j;

            // Get neighbors
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east  = shSrc[shMemIndex + 1];
            double west  = shSrc[shMemIndex - 1];

            // Calculate stencil and apply the operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }

    __syncthreads();
}