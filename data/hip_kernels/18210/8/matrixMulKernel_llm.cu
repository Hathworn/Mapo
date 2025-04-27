#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMulKernel(float *C, float *A, float *B, int width, int height) {
    // Define shared memory for tiles of A and B
    __shared__ float tileA[16][16];
    __shared__ float tileB[16][16];

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int row = blockIdx.y * blockDim.y + ty;
    int col = blockIdx.x * blockDim.x + tx;

    float sum = 0;

    // Loop over all tiles
    for (int m = 0; m < (width - 1) / 16 + 1; ++m) {
        // Load data into shared memory if within bounds
        if (row < height && m * 16 + tx < width)
            tileA[ty][tx] = A[row * width + m * 16 + tx];
        else
            tileA[ty][tx] = 0;

        if (col < width && m * 16 + ty < height)
            tileB[ty][tx] = B[(m * 16 + ty) * width + col];
        else
            tileB[ty][tx] = 0;

        __syncthreads();

        // Compute using shared memory tiles
        for (int k = 0; k < 16; ++k)
            sum += tileA[ty][k] * tileB[k][tx];

        __syncthreads();
    }

    // Write result to global memory
    if (row < height && col < width)
        C[row * width + col] = sum;
}