```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double *dst, double *src, int M, int N) {
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double *shSrc = shared_mem;

    // Calculate global thread indices
    int global_i = blockIdx.x * blockDim.x + threadIdx.x;
    int global_j = blockIdx.y * blockDim.y + threadIdx.y;

    // Shared memory indices
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;
    int local_i = threadIdx.x;
    int local_j = threadIdx.y;

    int shMemIndex = (local_i + HALO) * smColDim + (local_j + HALO);

    // Load shared memory with halo data
    for (int i = -HALO; i < TILE_SIZE + HALO; i++) {
        for (int j = -HALO; j < TILE_SIZE + HALO; j++) {
            int i_global = global_i * TILE_SIZE + i;
            int j_global = global_j * TILE_SIZE + j;
            if (i_global >= 0 && i_global < M && j_global >= 0 && j_global < N) {
                shSrc[(local_i * TILE_SIZE + i + HALO) * smColDim + (local_j * TILE_SIZE + j + HALO)] =
                            src[i_global * N + j_global];
            }
        }
    }

    __syncthreads();

    // Perform stencil operation
    if (global_i < M / TILE_SIZE && global_j < N / TILE_SIZE) {
        for (int i = 0; i < TILE_SIZE; i++) {
            for (int j = 0; j < TILE_SIZE; j++) {
                double north = shSrc[shMemIndex - smColDim + i * smColDim + j];
                double south = shSrc[shMemIndex + smColDim + i * smColDim + j];
                double east  = shSrc[shMemIndex + 1 + i * smColDim + j];
                double west  = shSrc[shMemIndex - 1 + i * smColDim + j];
                dst[(global_i * TILE_SIZE + i) * N + (global_j * TILE_SIZE + j)] =
                    (north + south + east + west) / 5.5;
            }
        }
    }
}