#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // Compute thread's global index
    int global_i = blockIdx.x * blockDim.x * TILE_SIZE + threadIdx.x * TILE_SIZE;
    int global_j = blockIdx.y * blockDim.y * TILE_SIZE + threadIdx.y * TILE_SIZE;

    // SharedMem Columns and Rows Dimension
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Iterate over tile size block
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = global_i * N + i * N + global_j + j + HALO;
            int shMemIndex = HALO * smColDim + threadIdx.x * smColDim * TILE_SIZE + i * smColDim + HALO + threadIdx.y * TILE_SIZE + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Load haloes into shared memory
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        int indexHalo, shMemIndex;
        // Top and Bottom Halos
        for (int i = 0; i < HALO; i++) {
            for (int j = 0; j < smColDim; j++) {
                indexHalo = (blockIdx.x * blockDim.x * TILE_SIZE + i) * N + blockIdx.y * blockDim.y * TILE_SIZE + j;
                shSrc[i * smColDim + j] = src[indexHalo];
                indexHalo = (HALO + (blockIdx.x + 1) * blockDim.x * TILE_SIZE) * N + blockIdx.y * blockDim.y * TILE_SIZE + j;
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[indexHalo];
            }
        }
        // Left and Right Halos
        for (int i = 0; i < HALO; i++) {
            for (int j = 0; j < smRowDim - HALO * 2; j++) {
                indexHalo = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + blockIdx.y * blockDim.y * TILE_SIZE + i;
                shSrc[(HALO + j) * smColDim + i] = src[indexHalo];
                indexHalo = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + ((blockIdx.y + 1) * blockDim.y * TILE_SIZE) + HALO + i;
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[indexHalo];
            }
        }
    }

    __syncthreads();

    // Perform stencil computation
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = global_i * N + i * N + global_j + j + HALO;
            int shMemIndex = HALO * smColDim + threadIdx.x * smColDim * TILE_SIZE + i * smColDim + HALO + threadIdx.y * TILE_SIZE + j;
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east = shSrc[shMemIndex + 1];
            double west = shSrc[shMemIndex - 1];
            // Real Stencil operation
            dst[globalIndex] = (north + south + east + west) / 4.0;
        }
    }

    __syncthreads();
}