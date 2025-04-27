#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double* dst, double* src, int M, int N) {
    extern __shared__ double shared_mem[];
    double* shSrc = shared_mem;

    // Shared memory dimensions
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Calculate global and shared memory indices
    int global_i = blockIdx.x * blockDim.x * TILE_SIZE + threadIdx.x * TILE_SIZE + HALO;
    int global_j = blockIdx.y * blockDim.y * TILE_SIZE + threadIdx.y * TILE_SIZE + HALO;
    int shMem_i = HALO + threadIdx.x * TILE_SIZE;
    int shMem_j = HALO + threadIdx.y * TILE_SIZE;

    // Load inner part to shared memory
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = (global_i + i) * N + global_j + j;
            int shMemIndex = (shMem_i + i) * smColDim + shMem_j + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Load halos into shared memory
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        // Top and bottom halos
        for (int i = 0; i < HALO; i++) {
            for (int j = 0; j < smColDim; j++) {
                int topIndex = (global_i - HALO + i) * N + global_j - HALO + j;
                int bottomIndex = (global_i + blockDim.x * TILE_SIZE + i) * N + global_j - HALO + j;
                shSrc[i * smColDim + j] = src[topIndex];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[bottomIndex];
            }
        }

        // Left and right halos
        for (int i = 0; i < smRowDim - HALO * 2; i++) {
            for (int j = 0; j < HALO; j++) {
                int leftIndex = (global_i - HALO + i) * N + global_j - HALO + j;
                int rightIndex = (global_i - HALO + i) * N + global_j + blockDim.y * TILE_SIZE + j;
                shSrc[(HALO + i) * smColDim + j] = src[leftIndex];
                shSrc[(HALO + i + 1) * smColDim - HALO + j] = src[rightIndex];
            }
        }
    }
    
    __syncthreads();

    // Compute result
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = (global_i + i) * N + global_j + j;
            int shMemIndex = (shMem_i + i) * smColDim + shMem_j + j;

            // Fetch neighbors
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east = shSrc[shMemIndex + 1];
            double west = shSrc[shMemIndex - 1];

            // Stencil computation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }
}