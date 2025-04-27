#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // Simplify index calculations by using direct index variables
    int tx = threadIdx.x, ty = threadIdx.y;
    int blockIdx_x = blockIdx.x, blockIdx_y = blockIdx.y;
    int blockDim_x = blockDim.x, blockDim_y = blockDim.y;
    int tileIdxX = blockIdx_x * blockDim_x * TILE_SIZE;
    int tileIdxY = blockIdx_y * blockDim_y * TILE_SIZE;
    int smColDim = HALO * 2 + blockDim_y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim_x * TILE_SIZE;
    
    // Copying to shared memory - Inner part with loop unrolling
    for (int i = 0; i < TILE_SIZE; ++i) {
        for (int j = 0; j < TILE_SIZE; ++j) {
            int globalIndex = HALO * N + tileIdxX * N + tx * TILE_SIZE * N + i * N + tileIdxY + ty * TILE_SIZE + j + HALO;
            int shMemIndex = HALO * smColDim + tx * smColDim * TILE_SIZE + i * smColDim + HALO + ty * TILE_SIZE + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Load halos using specific threads only
    if (tx == 0 && ty == 0) {
        for (int i = 0; i < HALO; ++i) {
            for (int j = 0; j < smColDim; ++j) {
                // Top and Bottom Halos
                int indexTopHalo = (blockIdx_x * blockDim_x * TILE_SIZE + i) * N + tileIdxY + j;
                int indexBottomHalo = (HALO + (blockIdx_x + 1) * blockDim_x * TILE_SIZE) * N + tileIdxY + j;
                shSrc[i * smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + blockDim_x * TILE_SIZE + i) * smColDim + j] = src[indexBottomHalo];
            }
        }
        for (int i = 0; i < HALO; ++i) {
            for (int j = 0; j < smRowDim - HALO * 2; ++j) {
                // Left and Right Halos
                int indexLeftHalo = (HALO + blockIdx_x * blockDim_x * TILE_SIZE + j) * N + tileIdxY + i;
                int indexRightHalo = (HALO + blockIdx_x * blockDim_x * TILE_SIZE + j) * N + ((blockIdx_y + 1) * blockDim_y * TILE_SIZE) + HALO + i;
                shSrc[(HALO + j) * smColDim + i] = src[indexLeftHalo];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[indexRightHalo];
            }
        }
    }

    __syncthreads();

    // Perform stencil operation with index recalculation
    for (int i = 0; i < TILE_SIZE; ++i) {
        for (int j = 0; j < TILE_SIZE; ++j) {
            int globalIndex = HALO * N + tileIdxX * N + tx * TILE_SIZE * N + i * N + tileIdxY + ty * TILE_SIZE + j + HALO;
            int shMemIndex = HALO * smColDim + tx * smColDim * TILE_SIZE + i * smColDim + HALO + ty * TILE_SIZE + j;

            // Getting the neighbors
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east = shSrc[shMemIndex + 1];
            double west = shSrc[shMemIndex - 1];

            // Real Stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }

    __syncthreads();
}