#include "hip/hip_runtime.h"
#include "includes.h"

__device__ size_t GIDX(size_t row, size_t col, int W) {
    return row * W + col;
}

__global__ void kernel_sub(float* d_f1ptr, float* d_f2ptr, float* d_dt, int H, int W) {

    // Calculate the global thread index
    size_t row = blockIdx.y * blockDim.y + threadIdx.y;
    size_t col = blockIdx.x * blockDim.x + threadIdx.x;

    // Early return if the thread index is outside the bounds
    if (row < H && col < W) {
        size_t idx = GIDX(row, col, W);
        // Subtract and store result
        d_dt[idx] = d_f2ptr[idx] - d_f1ptr[idx];
    }
}