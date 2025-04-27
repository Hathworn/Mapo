#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // Precompute indices outside of the loops for reuse
    const int blockOffsetX = blockIdx.x * blockDim.x * TILE_SIZE;
    const int blockOffsetY = blockIdx.y * blockDim.y * TILE_SIZE;
    const int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    const int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;
  
    const int threadOffsetX = threadIdx.x * TILE_SIZE;
    const int threadOffsetY = threadIdx.y * TILE_SIZE;
  
    // Copying to shared memory
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = HALO * N + blockOffsetX * N + threadOffsetX * N + i * N + blockOffsetY + threadOffsetY + j + HALO;
            int shMemIndex = HALO * smColDim + threadOffsetX * smColDim + i * smColDim + HALO + threadOffsetY + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Halos, handled by one thread
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        for (int i = 0; i < HALO; i++) {
            for (int j = 0; j < smColDim; j++) {
                int indexTopHalo = (blockOffsetX + i) * N + blockOffsetY + j;
                int indexBottomHalo = (HALO + blockOffsetX + blockDim.x * TILE_SIZE) * N + blockOffsetY + j;
                shSrc[i * smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[indexBottomHalo];
            }
        }

        for (int j = 0; j < smRowDim - HALO * 2; j++) {
            for (int i = 0; i < HALO; i++) {
                int indexLeftHalo = (HALO + blockOffsetX + j) * N + blockOffsetY + i;
                int indexRightHalo = (HALO + blockOffsetX + j) * N + (blockOffsetY + blockDim.y * TILE_SIZE) + HALO + i;
                shSrc[(HALO + j) * smColDim + i] = src[indexLeftHalo];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[indexRightHalo];
            }
        }
    }
    __syncthreads();

    // Stencil computation
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = HALO * N + blockOffsetX * N + threadOffsetX * N + i * N + blockOffsetY + threadOffsetY + j + HALO;
            int shMemIndex = HALO * smColDim + threadOffsetX * smColDim + i * smColDim + HALO + threadOffsetY + j;

            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east  = shSrc[shMemIndex + 1];
            double west  = shSrc[shMemIndex - 1];
  
            // Optimized stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }
    __syncthreads();
}