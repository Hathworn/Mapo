#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // SharedMem Collumns Dimension
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Calculate global and shared memory indexes
    int globalBaseIndex = HALO * N + blockIdx.x * blockDim.x * TILE_SIZE * N + blockIdx.y * blockDim.y * TILE_SIZE + HALO;
    int shMemBaseIndex = HALO * smColDim + HALO;

    // Copying to shared memory (Inner part)
    for (int i = 0; i < TILE_SIZE; ++i) {
        for (int j = 0; j < TILE_SIZE; ++j) {
            int globalIndex = globalBaseIndex + threadIdx.x * TILE_SIZE * N + i * N + threadIdx.y * TILE_SIZE + j;
            int shMemIndex = shMemBaseIndex + threadIdx.x * smColDim * TILE_SIZE + i * smColDim + threadIdx.y * TILE_SIZE + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Synchronize threads before adding halos
    __syncthreads();

    // Halos (performed by a single thread)
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        for (int i = 0; i < HALO; ++i) {
            for (int j = 0; j < smColDim; ++j) {
                int topHaloIndex = (blockIdx.x * blockDim.x * TILE_SIZE + i) * N + blockIdx.y * blockDim.y * TILE_SIZE + j;
                int bottomHaloIndex = (HALO + (blockIdx.x + 1) * blockDim.x * TILE_SIZE) * N + blockIdx.y * blockDim.y * TILE_SIZE + j;
                shSrc[i * smColDim + j] = src[topHaloIndex];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[bottomHaloIndex];
            }
        }

        for (int i = 0; i < HALO; ++i) {
            for (int j = 0; j < smRowDim - HALO * 2; ++j) {
                int leftHaloIndex = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + blockIdx.y * blockDim.y * TILE_SIZE + i;
                int rightHaloIndex = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + (blockIdx.y + 1) * blockDim.y * TILE_SIZE + HALO + i;
                shSrc[(HALO + j) * smColDim + i] = src[leftHaloIndex];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[rightHaloIndex];
            }
        }
    }

    // Synchronize threads before computing the stencil
    __syncthreads();

    // Stencil calculations
    for (int i = 0; i < TILE_SIZE; ++i) {
        for (int j = 0; j < TILE_SIZE; ++j) {
            int globalIndex = globalBaseIndex + threadIdx.x * TILE_SIZE * N + i * N + threadIdx.y * TILE_SIZE + j;
            int shMemIndex = shMemBaseIndex + threadIdx.x * smColDim * TILE_SIZE + i * smColDim + threadIdx.y * TILE_SIZE + j;

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