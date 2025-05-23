#include "hip/hip_runtime.h"
#include "includes.h"

__device__ size_t GIDX(size_t row, size_t col, int H, int W) {
    return row * W + col;
}

__global__ void kernel_partials(float* d_f1ptr, float* d_f1dx, float* d_f1dy, int H, int W) {

    size_t row = threadIdx.y + blockDim.y * blockIdx.y;
    size_t col = threadIdx.x + blockDim.x * blockIdx.x;

    if (row < 1 || row >= H - 1 || col < 1 || col >= W - 1) {
        // Exit early if thread is out of bounds
        return;
    }

    size_t idx = GIDX(row, col, H, W);

    // Load shared memory to reduce global memory access (if needed in further optimization)
    // Compute partial derivatives using precomputed indices
    float gray_x1 = d_f1ptr[GIDX(row, col - 1, H, W)];
    float gray_x2 = d_f1ptr[GIDX(row, col + 1, H, W)];
    float gray_y1 = d_f1ptr[GIDX(row - 1, col, H, W)];
    float gray_y2 = d_f1ptr[GIDX(row + 1, col, H, W)];

    d_f1dx[idx] = (gray_x2 - gray_x1) * 0.5f;  // Use constant multiplication
    d_f1dy[idx] = (gray_y2 - gray_y1) * 0.5f;
}