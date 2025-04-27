#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double *dst, double *src, int M, int N) {
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double *shSrc = shared_mem;

    // Calculate thread indices once
    int tx = threadIdx.x, ty = threadIdx.y;
    int bx = blockIdx.x, by = blockIdx.y;
    int t_offset = ty * TILE_SIZE + tx;

    // Shared memory dimensions
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    
    // Optimize global and shared memory indices calculations
    int globalIndexBase = HALO * N + bx * blockDim.x * TILE_SIZE * N + by * blockDim.y * TILE_SIZE;
    int shMemIndexBase = HALO * smColDim + tx * smColDim * TILE_SIZE + HALO;

    // Load data to shared memory
    for (int i = 0; i < TILE_SIZE; i++) {
        int gIndex = globalIndexBase + tx * TILE_SIZE * N + i * N + ty * TILE_SIZE + HALO;
        int sIndex = shMemIndexBase + i * smColDim + t_offset;
        shSrc[sIndex] = src[gIndex];
    }

    // Load halo regions using boundary threads
    if (tx == 0 && ty == 0) {
        int topHaloOffset = bx * blockDim.x * TILE_SIZE;
        int bottomHaloOffset = (HALO + (bx + 1) * blockDim.x * TILE_SIZE);

        for (int i = 0; i < HALO; ++i) {
            for (int j = 0; j < smColDim; ++j) {
                shSrc[i * smColDim + j] = src[(topHaloOffset + i) * N + by * blockDim.y * TILE_SIZE + j];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[(bottomHaloOffset + i) * N + by * blockDim.y * TILE_SIZE + j];
            }
        }

        int leftColOffset = HALO + bx * blockDim.x * TILE_SIZE;
        int rightColOffset = (HALO + (by + 1) * blockDim.y * TILE_SIZE + HALO);

        for (int i = 0; i < HALO; ++i) {
            for (int j = 0; j < smColDim - HALO * 2; ++j) {
                shSrc[(HALO + j) * smColDim + i] = src[(leftColOffset + j) * N + by * blockDim.y * TILE_SIZE + i];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[(leftColOffset + j) * N + rightColOffset + i];
            }
        }
    }

    __syncthreads();

    // Perform computation
    for (int i = 0; i < TILE_SIZE; i++) {
        int globalIndex = globalIndexBase + tx * TILE_SIZE * N + i * N + t_offset;
        int shMemIndex = shMemIndexBase + i * smColDim + t_offset;
        double north = shSrc[shMemIndex - smColDim];
        double south = shSrc[shMemIndex + smColDim];
        double east = shSrc[shMemIndex + 1];
        double west = shSrc[shMemIndex - 1];

        // Real stencil operation
        dst[globalIndex] = (north + south + east + west) / 5.5;
    }

    __syncthreads();
}