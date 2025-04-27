```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N) {
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // SharedMem Columns and Rows Dimension
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Calculate thread's global and shared coordinates
    int baseGlobalIndexX = HALO * N + blockIdx.x * blockDim.x * TILE_SIZE * N;
    int baseGlobalIndexY = blockIdx.y * blockDim.y * TILE_SIZE + HALO;
    int baseShMemIndexX = HALO * smColDim + threadIdx.x * smColDim * TILE_SIZE;
    int baseShMemIndexY = HALO + threadIdx.y * TILE_SIZE;

    // Load data into shared memory
    for (int i = 0; i < TILE_SIZE; i++) {
        #pragma unroll  // Unrolling loop for potential register reuse
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = baseGlobalIndexX + threadIdx.x * TILE_SIZE * N + i * N + baseGlobalIndexY + threadIdx.y * TILE_SIZE + j;
            int shMemIndex = baseShMemIndexX + i * smColDim + baseShMemIndexY + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Handle Halos using a single thread per block
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        int indexTopHalo, indexBottomHalo;
        int indexLeftHalo, indexRightHalo;

        // For Bottom and top row
        for (int i = 0; i < HALO; i++) {
            for (int j = 0; j < smColDim; j++) {
                indexTopHalo = (blockIdx.x * blockDim.x * TILE_SIZE + i) * N + (blockIdx.y * blockDim.y * TILE_SIZE) + j;
                indexBottomHalo = (HALO + (blockIdx.x + 1) * blockDim.x * TILE_SIZE) * N + (blockIdx.y * blockDim.y * TILE_SIZE) + j;
                shSrc[i * smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[indexBottomHalo];
            }
        }

        // For right and left Columns
        for (int i = 0; i < HALO; i++) {
            for (int j = 0; j < smRowDim - HALO * 2; j++) {
                indexLeftHalo = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + (blockIdx.y * blockDim.y * TILE_SIZE) + i;
                indexRightHalo = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + ((blockIdx.y + 1) * blockDim.y * TILE_SIZE) + HALO + i;
                shSrc[(HALO + j) * smColDim + i] = src[indexLeftHalo];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[indexRightHalo];
            }
        }
    }

    __syncthreads();

    // Apply stencil operation
    for (int i = 0; i < TILE_SIZE; i++) {
        #pragma unroll  // Unrolling loop for potential performance gains
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = baseGlobalIndexX + threadIdx.x * TILE_SIZE * N + i * N + baseGlobalIndexY + threadIdx.y * TILE_SIZE + j;
            int shMemIndex = baseShMemIndexX + i * smColDim + baseShMemIndexY + j;

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