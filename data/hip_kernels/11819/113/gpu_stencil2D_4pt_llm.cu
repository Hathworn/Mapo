#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double *dst, double *src, int M, int N) {
    // Declare shared memory
    extern __shared__ double shared_mem[];
    double *shSrc = shared_mem;

    // Initialize indexes
    int i, j;

    // Neighbor's values
    double north, south, east, west;

    // Define SharedMem Dimensions
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Compute global and shared memory indices
    int globalIndexBase = HALO * N + blockIdx.x * blockDim.x * TILE_SIZE * N + blockIdx.y * blockDim.y * TILE_SIZE;
    int shMemIndexBase = HALO * smColDim + threadIdx.x * smColDim * TILE_SIZE + HALO + threadIdx.y * TILE_SIZE;

    // Copy data to shared memory
    for (i = 0; i < TILE_SIZE; i++) {
        for (j = 0; j < TILE_SIZE; j++) {
            int globalIndex = globalIndexBase + threadIdx.x * TILE_SIZE * N + i * N + j + HALO;
            int shMemIndex = shMemIndexBase + i * smColDim + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Sync threads to ensure shared data is ready
    __syncthreads();

    // Handle halo regions using a single thread in each block
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        // Prepare indices for halo operations
        for (i = 0; i < HALO; i++) {
            for (j = 0; j < smColDim; j++) {
                // Top and bottom halos
                int indexTopHalo = (blockIdx.x * blockDim.x * TILE_SIZE + i) * N + blockIdx.y * blockDim.y * TILE_SIZE + j;
                int indexBottomHalo = (HALO + (blockIdx.x + 1) * blockDim.x * TILE_SIZE) * N + blockIdx.y * blockDim.y * TILE_SIZE + j;
                shSrc[i * smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[indexBottomHalo];
            }
        }
        for (j = 0; j < smRowDim - HALO * 2; j++) {
            // Left and right halos
            int indexLeftHalo = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + blockIdx.y * blockDim.y * TILE_SIZE;
            int indexRightHalo = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + ((blockIdx.y + 1) * blockDim.y * TILE_SIZE) + HALO;
            shSrc[(HALO + j) * smColDim] = src[indexLeftHalo];
            shSrc[(HALO + j + 1) * smColDim - HALO] = src[indexRightHalo];
        }
    }

    // Sync before reading shared data
    __syncthreads();

    // Compute stencil operation
    for (i = 0; i < TILE_SIZE; i++) {
        for (j = 0; j < TILE_SIZE; j++) {
            int globalIndex = globalIndexBase + threadIdx.x * TILE_SIZE * N + i * N + threadIdx.y * TILE_SIZE + j + HALO;
            int shMemIndex = shMemIndexBase + i * smColDim + j;

            // Fetch neighbors
            north = shSrc[shMemIndex - smColDim];
            south = shSrc[shMemIndex + smColDim];
            east  = shSrc[shMemIndex + 1];
            west  = shSrc[shMemIndex - 1];

            // Perform actual stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }
}