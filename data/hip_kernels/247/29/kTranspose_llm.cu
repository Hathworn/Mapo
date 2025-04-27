#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kTranspose(float* a, float* dest, int width, int height) {
    const int bx = blockIdx.x * blockDim.x;
    const int by = blockIdx.y * blockDim.y;
    const int tx = threadIdx.x;
    const int ty = threadIdx.y;

    __shared__ float smem[ADD_BLOCK_SIZE][ADD_BLOCK_SIZE + 1];

    int row = by + ty;
    int col = bx + tx;

    // Load input elements into shared memory
    if (col < width && row < height) {
        smem[ty][tx] = a[row * width + col];
    }
    __syncthreads();

    // Transpose the elements and store in destination matrix
    row = bx + ty;
    col = by + tx;

    if (row < width && col < height) {
        dest[col * width + row] = smem[tx][ty];
    }
}