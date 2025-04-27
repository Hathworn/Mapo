#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // Compute indices
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int bx = blockIdx.x;
    int by = blockIdx.y;

    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Compute global and shared memory indices for tiles
    int globalBaseIndex = HALO * N + bx * blockDim.x * TILE_SIZE * N + tx * TILE_SIZE * N + by * blockDim.y * TILE_SIZE + ty * TILE_SIZE + HALO;
    int shMemBaseIndex = HALO * smColDim + tx * smColDim * TILE_SIZE + HALO + ty * TILE_SIZE;

    // Load tile into shared memory
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = globalBaseIndex + i * N + j;
            int shMemIndex = shMemBaseIndex + i * smColDim + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Synchronize to make sure the data is loaded
    __syncthreads();

    // Load halo regions only once
    if (tx == 0 && ty == 0)
    {
        // Top and bottom halo
        for (int j = 0; j < smColDim; j++) {
            shSrc[j] = src[(bx * blockDim.x * TILE_SIZE) * N + (by * blockDim.y * TILE_SIZE) + j];
            shSrc[(HALO + blockDim.x * TILE_SIZE) * smColDim + j] = src[(HALO + (bx + 1) * blockDim.x * TILE_SIZE) * N + (by * blockDim.y * TILE_SIZE) + j];
        }
        // Left and right halo
        for (int i = 0; i < smRowDim - HALO * 2; i++) {
            shSrc[(HALO + i) * smColDim] = src[(HALO + bx * blockDim.x * TILE_SIZE + i) * N + (by * blockDim.y * TILE_SIZE)];
            shSrc[(HALO + i + 1) * smColDim - HALO] = src[(HALO + bx * blockDim.x * TILE_SIZE + i) * N + ((by + 1) * blockDim.y * TILE_SIZE) + HALO];
        }
    }

    // Synchronize to make sure the edges are loaded
    __syncthreads();

    // Stencil computation
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = globalBaseIndex + i * N + j;
            int shMemIndex = shMemBaseIndex + i * smColDim + j;
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east  = shSrc[shMemIndex + 1];
            double west  = shSrc[shMemIndex - 1];
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }
}