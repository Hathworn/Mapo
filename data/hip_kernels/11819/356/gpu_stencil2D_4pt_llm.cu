#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declare the shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // SharedMem Columns and Rows Dimension
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Calculate global and shared indices once
    int globalBaseIndex = HALO * N + blockIdx.x * blockDim.x * TILE_SIZE * N + threadIdx.x * TILE_SIZE * N + blockIdx.y * blockDim.y * TILE_SIZE + threadIdx.y * TILE_SIZE + HALO;
    int shMemBaseIndex = HALO * smColDim + threadIdx.x * smColDim * TILE_SIZE + HALO + threadIdx.y * TILE_SIZE;

    // Copying to shared memory
    for (int i = 0; i < TILE_SIZE; ++i) {
        for (int j = 0; j < TILE_SIZE; ++j) {
            shSrc[shMemBaseIndex + i * smColDim + j] = src[globalBaseIndex + i * N + j];
        }
    }

    // Load Halos only once to reduce overhead
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        for (int i = 0; i < HALO; ++i) {
            for (int j = 0; j < smColDim; ++j) {
                shSrc[i * smColDim + j] = src[(blockIdx.x * blockDim.x * TILE_SIZE + i) * N + (blockIdx.y * blockDim.y * TILE_SIZE) + j];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[(HALO + (blockIdx.x + 1) * blockDim.x * TILE_SIZE) * N + (blockIdx.y * blockDim.y * TILE_SIZE) + j];
            }
        }

        for (int i = 0; i < HALO; ++i) {
            for (int j = 0; j < smRowDim - HALO * 2; ++j) {
                shSrc[(HALO + j) * smColDim + i] = src[(HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + (blockIdx.y * blockDim.y * TILE_SIZE) + i];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[(HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + ((blockIdx.y + 1) * blockDim.y * TILE_SIZE) + HALO + i];
            }
        }
    }

    __syncthreads();

    for (int i = 0; i < TILE_SIZE; ++i) {
        for (int j = 0; j < TILE_SIZE; ++j) {
            int shMemIndex = shMemBaseIndex + i * smColDim + j;

            // Get the neighbors
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east  = shSrc[shMemIndex + 1];
            double west  = shSrc[shMemIndex - 1];

            // Real Stencil operation
            dst[globalBaseIndex + i * N + j] = (north + south + east + west) / 5.5;
        }
    }
    __syncthreads();
}