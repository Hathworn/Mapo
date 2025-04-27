#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencil_ld(unsigned *X, unsigned *out, int width, int height) {
    // Use shared memory for faster access
    __shared__ unsigned shared_X[34][34]; // extra padding to prevent out-of-bounds access
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int bx = blockIdx.x * blockDim.x;
    int by = blockIdx.y * blockDim.y;

    int x = bx + tx; 
    int y = by + ty;

    if (x >= width || y >= height) return; // boundary check

    // Load data into shared memory
    shared_X[ty + 1][tx + 1] = X[y * width + x];

    // Load boundary data for stencil operation
    if (tx == 0 && x > 0) shared_X[ty + 1][0] = X[y * width + x - 1];
    if (tx == 31 && x < width - 1) shared_X[ty + 1][33] = X[y * width + x + 1];
    if (ty == 0 && y > 0) shared_X[0][tx + 1] = X[(y - 1) * width + x];
    if (ty == 31 && y < height - 1) shared_X[33][tx + 1] = X[(y + 1) * width + x];

    __syncthreads();

    // Stencil computation
    int result = (kernel[0][0] * shared_X[ty][tx] +
                  kernel[0][1] * shared_X[ty][tx + 1] +
                  kernel[0][2] * shared_X[ty][tx + 2] +
                  kernel[1][0] * shared_X[ty + 1][tx] +
                  kernel[1][1] * shared_X[ty + 1][tx + 1] +
                  kernel[1][2] * shared_X[ty + 1][tx + 2] +
                  kernel[2][0] * shared_X[ty + 2][tx] +
                  kernel[2][1] * shared_X[ty + 2][tx + 1] +
                  kernel[2][2] * shared_X[ty + 2][tx + 2]);

    // Result clamping
    if (result < 0) out[y * width + x] = 0;
    else if (result > 255) out[y * width + x] = 255;
    else out[y * width + x] = result;
}