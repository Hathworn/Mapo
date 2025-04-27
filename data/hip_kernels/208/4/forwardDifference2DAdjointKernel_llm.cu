#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void forwardDifference2DAdjointKernel(const int cols, const int rows, const float* dx, const float* dy, float* target) {
    // Use shared memory for better performance; allocate space for a tile
    __shared__ float s_dx[TILE_DIM + 1][TILE_DIM + 1];
    __shared__ float s_dy[TILE_DIM + 1][TILE_DIM + 1];

    // Calculating global indices
    int global_idx = blockIdx.x * blockDim.x + threadIdx.x;
    int global_idy = blockIdx.y * blockDim.y + threadIdx.y;

    // Load data into shared memory with boundary checks
    if (global_idx < rows && global_idy < cols) {
        s_dx[threadIdx.y][threadIdx.x] = dx[global_idy * rows + global_idx];
        s_dy[threadIdx.y][threadIdx.x] = dy[global_idy * rows + global_idx];
    }
    __syncthreads();

    // Processing central elements of the block (avoids boundary overwrite)
    if (global_idx > 0 && global_idx < rows - 1 && global_idy > 0 && global_idy < cols - 1) {
        const auto index = global_idy * rows + global_idx;
        target[index] = -s_dx[threadIdx.y][threadIdx.x] + s_dx[threadIdx.y][threadIdx.x - 1]
                        - s_dy[threadIdx.y][threadIdx.x] + s_dy[threadIdx.y - 1][threadIdx.x];
    }
}