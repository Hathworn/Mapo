#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // SharedMem Collumns Dimension
    int smColDim = HALO*2+blockDim.y*TILE_SIZE;
    int smRowDim = HALO*2+blockDim.x*TILE_SIZE;

    // Calculate thread's base indices
    int baseGlobalX = blockIdx.x * blockDim.x * TILE_SIZE;
    int baseGlobalY = blockIdx.y * blockDim.y * TILE_SIZE;

    // Linearize shared memory indices
    int threadBaseX = HALO + threadIdx.x * TILE_SIZE;
    int threadBaseY = HALO + threadIdx.y * TILE_SIZE;

    // Copy inner part to shared memory
    for (int i = 0; i < TILE_SIZE; ++i) {
        for (int j = 0; j < TILE_SIZE; ++j) {
            int globalIndex = (HALO + baseGlobalX + threadIdx.x * TILE_SIZE + i) * N 
                            + (HALO + baseGlobalY + threadIdx.y * TILE_SIZE + j);
            int shMemIndex = (threadBaseX + i) * smColDim + (threadBaseY + j);
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Synchronize to ensure all loads to shared memory are complete
    __syncthreads();

    // Copy halo regions only by the first thread
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        int indexTopHalo, indexBottomHalo, indexLeftHalo, indexRightHalo;

        // Halo - Top and Bottom Rows
        for (int i = 0; i < HALO; ++i) {
            for (int j = 0; j < smColDim; ++j) {
                indexTopHalo = (baseGlobalX + i) * N + (baseGlobalY + j);
                indexBottomHalo = (HALO + baseGlobalX + blockDim.x * TILE_SIZE + i) * N + (baseGlobalY + j);
                shSrc[i * smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[indexBottomHalo];
            }
        }

        // Halo - Left and Right Columns
        for (int i = 0; i < HALO; ++i) {
            for (int j = 0; j < smRowDim - HALO*2; ++j) {
                indexLeftHalo = (HALO + baseGlobalX + j) * N + (baseGlobalY + i);
                indexRightHalo = (HALO + baseGlobalX + j) * N + (HALO + baseGlobalY + blockDim.y * TILE_SIZE + i);
                shSrc[(HALO + j) * smColDim + i] = src[indexLeftHalo];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[indexRightHalo];
            }
        }
    }

    // Synchronize to ensure halo region is loaded
    __syncthreads();

    // Stencil operation
    for (int i = 0; i < TILE_SIZE; ++i) {
        for (int j = 0; j < TILE_SIZE; ++j) {
            int globalIndex = (HALO + baseGlobalX + threadIdx.x * TILE_SIZE + i) * N 
                            + (HALO + baseGlobalY + threadIdx.y * TILE_SIZE + j);
            int shMemIndex = (threadBaseX + i) * smColDim + (threadBaseY + j);

            // Accessing neighbors
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east  = shSrc[shMemIndex + 1];
            double west  = shSrc[shMemIndex - 1];

            // Real Stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }
}