```c
#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}
#define ROTATE_DOWN(val,MAX) ((val-1==-1)?MAX-1:val-1)
#define ROTATE_UP(val,MAX) ((val+1)%MAX)

__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declare shared memory for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // Determine block indices and size constants
    int smColDim = HALO*2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO*2 + blockDim.x * TILE_SIZE;
    int tileBaseRow = blockIdx.x * blockDim.x * TILE_SIZE;
    int tileBaseCol = blockIdx.y * blockDim.y * TILE_SIZE;

    // Efficiently copy to shared memory using one-dimensional thread index
    int tIdx = threadIdx.y * blockDim.x + threadIdx.x;
    int tDim = blockDim.x * blockDim.y;

    for (int i = tIdx; i < TILE_SIZE * TILE_SIZE; i += tDim) {
        int localRow = i / TILE_SIZE;
        int localCol = i % TILE_SIZE;
        int globalIndex = HALO * N + tileBaseRow * N + localRow * N + tileBaseCol + HALO + localCol;
        int shMemIndex = HALO * smColDim + localRow * smColDim + HALO + localCol;
        shSrc[shMemIndex] = src[globalIndex];
    }

    __syncthreads();

    // Load halos for top/bottom and left/right borders
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        for (int i = 0; i < HALO; ++i) {
            for (int j = 0; j < smColDim; ++j) {
                // Top halo
                shSrc[i * smColDim + j] = src[(tileBaseRow + i) * N + tileBaseCol + j];
                // Bottom halo
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[(HALO + tileBaseRow + blockDim.x * TILE_SIZE + i) * N + tileBaseCol + j];
            }
            for (int j = HALO; j < smRowDim - HALO; ++j) {
                // Left halo
                shSrc[j * smColDim + i] = src[(HALO + tileBaseRow + j - HALO) * N + tileBaseCol + i];
                // Right halo
                shSrc[j * smColDim + smColDim - HALO + i] = src[(HALO + tileBaseRow + j - HALO) * N + tileBaseCol + blockDim.y * TILE_SIZE + i];
            }
        }
    }

    __syncthreads();

    // Perform stencil operation
    for (int i = tIdx; i < TILE_SIZE * TILE_SIZE; i += tDim) {
        int localRow = i / TILE_SIZE;
        int localCol = i % TILE_SIZE;
        int globalIndex = HALO * N + tileBaseRow * N + localRow * N + tileBaseCol + HALO + localCol;
        int shMemIndex = HALO * smColDim + localRow * smColDim + HALO + localCol;
        
        double north = shSrc[shMemIndex - smColDim];
        double south = shSrc[shMemIndex + smColDim];
        double east  = shSrc[shMemIndex + 1];
        double west  = shSrc[shMemIndex - 1];
        
        // Apply stencil operation
        dst[globalIndex] = (north + south + east + west) / 5.5;
    }

    __syncthreads();
}