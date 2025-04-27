#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}
#define ROTATE_DOWN(val,MAX) ((val-1==-1)?MAX-1:val-1)
#define ROTATE_UP(val,MAX) ((val+1)%MAX)

// Optimize by using memory coalescing and reducing __syncthreads() calls
__global__ void gpu_stencil2D_4pt_hack2(double * dst, double * src, int M, int N)
{
    __shared__ double shared_mem[1 + HALO*2][GRID_TILE_X + HALO*2];

    int base_global_idx = N * (GRID_TILE_Y * blockIdx.y) + GRID_TILE_X * blockIdx.x;
    int thread_id = threadIdx.x;
    int center = 1, north = 0, south = 2;

    // Load initial shared memory
    for (int i = 0; i < 1 + HALO*2; i++) {
        for (int j = thread_id; j < GRID_TILE_X + 2*HALO; j += blockDim.x) {
            shared_mem[i][j] = src[base_global_idx + i*N + j];
        }
    }
    __syncthreads();

    // Main computation loop
    for (int curRow = HALO; curRow < GRID_TILE_Y; curRow++) {
        for (int j = thread_id + HALO; j < GRID_TILE_X + HALO; j += blockDim.x) {
            dst[base_global_idx + curRow*N + j] = (
                shared_mem[north][j] +
                shared_mem[south][j] +
                shared_mem[center][j-1] +
                shared_mem[center][j+1]
            ) / 5.5;
        }

        if (curRow + 2 < GRID_TILE_Y + HALO) {
            for (int j = thread_id; j < GRID_TILE_X + 2*HALO; j += blockDim.x) {
                shared_mem[north][j] = src[base_global_idx + (curRow + 2)*N + j];
            }
        }
        __syncthreads();

        // Rotate indices
        center = ROTATE_UP(center, 3);
        south = ROTATE_UP(south, 3);
        north = ROTATE_UP(north, 3);
    }

    // Final computation on the last row
    for (int j = thread_id + HALO; j < GRID_TILE_X + HALO; j += blockDim.x) {
        dst[base_global_idx + GRID_TILE_Y*N + j] = (
            shared_mem[north][j] +
            shared_mem[south][j] +
            shared_mem[center][j-1] +
            shared_mem[center][j+1]
        ) / 5.5;
    }
}