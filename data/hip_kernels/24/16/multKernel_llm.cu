#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void multKernel(float *a, float *b, float *ab, int width)
{
    int tx = threadIdx.x, ty = threadIdx.y;
    int bx = blockIdx.x, by = blockIdx.y;

    // allocate tiles in __shared__ memory
    __shared__ float s_a[TILE_WIDTH][TILE_WIDTH];
    __shared__ float s_b[TILE_WIDTH][TILE_WIDTH];

    // calculate the row & col index to identify element to work on
    int row = by * blockDim.y + ty;
    int col = bx * blockDim.x + tx;
    float result = 0;

    // loop over the tiles of the input in phases
    for (int p = 0; p < width / TILE_WIDTH; ++p)
    {
        // Load data into shared memory with boundary check
        if (row < width && (p * TILE_WIDTH + tx) < width)
            s_a[ty][tx] = a[row * width + (p * TILE_WIDTH + tx)];
        else
            s_a[ty][tx] = 0.0;

        if ((p * TILE_WIDTH + ty) < width && col < width)
            s_b[ty][tx] = b[(p * TILE_WIDTH + ty) * width + col];
        else
            s_b[ty][tx] = 0.0;

        __syncthreads();

        // dot product between row of s_a and col of s_b
        for (int k = 0; k < TILE_WIDTH; ++k)
            result += s_a[ty][k] * s_b[k][tx];

        // sync threads to ensure all elements are processed
        __syncthreads();
    }

    // store the result with boundary check
    if (row < width && col < width)
        ab[row * width + col] = result;
}