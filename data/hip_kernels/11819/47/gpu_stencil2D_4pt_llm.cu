```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // SharedMem Columns and Rows Dimension
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Global indexes
    int globalIndex;
    int shMemIndex;

    // Calculate local (tile) start points in global memory
    int baseGlobalX = HALO * N + blockIdx.x * blockDim.x * TILE_SIZE * N + threadIdx.x * TILE_SIZE * N;
    int baseGlobalY = blockIdx.y * blockDim.y * TILE_SIZE + threadIdx.y * TILE_SIZE;

    // Copying inner part to shared memory
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            globalIndex = baseGlobalX + i * N + baseGlobalY + j + HALO;
            shMemIndex = HALO * smColDim + threadIdx.x * smColDim * TILE_SIZE + i * smColDim + HALO + threadIdx.y * TILE_SIZE + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    __syncthreads();

    // Handle halos, execute only on the first thread of the block once
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        int indexTopHalo, indexBottomHalo, indexLeftHalo, indexRightHalo;

        // Top and Bottom halos
        for (int i = 0; i < HALO; i++) {
            for (int j = 0; j < smColDim; j++) {
                indexTopHalo = (blockIdx.x * blockDim.x * TILE_SIZE + i) * N + blockIdx.y * blockDim.y * TILE_SIZE + j;
                indexBottomHalo = (HALO + (blockIdx.x + 1) * blockDim.x * TILE_SIZE) * N + blockIdx.y * blockDim.y * TILE_SIZE + j;
                shSrc[i * smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[indexBottomHalo];
            }
        }
        
        // Left and Right halos
        for (int i = 0; i < HALO; i++) {
            for (int j = 0; j < smRowDim - HALO * 2; j++) {
                indexLeftHalo = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + blockIdx.y * blockDim.y * TILE_SIZE + i;
                indexRightHalo = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + ((blockIdx.y + 1) * blockDim.y * TILE_SIZE) + HALO + i;
                shSrc[(HALO + j) * smColDim + i] = src[indexLeftHalo];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[indexRightHalo];
            }
        }
    }

    __syncthreads();

    // Apply stencil
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            globalIndex = baseGlobalX + i * N + baseGlobalY + j + HALO;
            shMemIndex = HALO * smColDim + threadIdx.x * smColDim * TILE_SIZE + i * smColDim + HALO + threadIdx.y * TILE_SIZE + j;

            // Fetch neighboring values
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east  = shSrc[shMemIndex + 1];
            double west  = shSrc[shMemIndex - 1];

            // Perform stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }
}