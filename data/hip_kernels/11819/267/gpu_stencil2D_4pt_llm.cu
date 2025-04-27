#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Use shared memory for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // Calculate shared memory dimensions
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Compute global start index
    int global_i = blockIdx.x * blockDim.x * TILE_SIZE + HALO + threadIdx.x * TILE_SIZE;
    int global_j = blockIdx.y * blockDim.y * TILE_SIZE + HALO + threadIdx.y * TILE_SIZE;

    // Load inner tile to shared memory
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = (global_i + i) * N + (global_j + j);
            int shMemIndex = (threadIdx.x * TILE_SIZE + i + HALO) * smColDim + (threadIdx.y * TILE_SIZE + j + HALO);
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Synchronize to ensure all threads have loaded the data
    __syncthreads();

    // Load halo elements only if using first thread
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        for (int i = 0; i < HALO; i++) {
            // Load top and bottom halos
            for (int j = 0; j < smColDim; j++) {
                int indexTop = (blockIdx.x * blockDim.x * TILE_SIZE + i) * N + (blockIdx.y * blockDim.y * TILE_SIZE) + j;
                int indexBottom = (HALO + (blockIdx.x + 1) * blockDim.x * TILE_SIZE) * N + (blockIdx.y * blockDim.y * TILE_SIZE) + j;
                shSrc[i * smColDim + j] = src[indexTop];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[indexBottom];
            }

            // Load left and right halos
            for (int j = 0; j < smRowDim - HALO * 2; j++) {
                int indexLeft = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + (blockIdx.y * blockDim.y * TILE_SIZE) + i;
                int indexRight = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + ((blockIdx.y + 1) * blockDim.y * TILE_SIZE) + HALO + i;
                shSrc[(HALO + j) * smColDim + i] = src[indexLeft];
                shSrc[(HALO + j) * smColDim + smColDim - HALO + i] = src[indexRight];
            }
        }
    }

    // Synchronize again before stencil computation
    __syncthreads();

    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = (global_i + i) * N + (global_j + j);
            int shMemIndex = (threadIdx.x * TILE_SIZE + i + HALO) * smColDim + (threadIdx.y * TILE_SIZE + j + HALO);

            // Perform stencil operation
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east  = shSrc[shMemIndex + 1];
            double west  = shSrc[shMemIndex - 1];
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }
}