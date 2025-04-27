#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16  // Ensure TILE_WIDTH is defined

__global__ void matrix_multiply(float *a, float *b, float *c, int num, size_t width)
{
    // Thread and block index shorthand
    int tx = threadIdx.x, ty = threadIdx.y;
    int bx = blockIdx.x, by = blockIdx.y;

    // Allocate tiles in shared memory
    __shared__ float s_a[TILE_WIDTH][TILE_WIDTH];
    __shared__ float s_b[TILE_WIDTH][TILE_WIDTH];

    // Row and column index calculations
    int row = by * blockDim.y + ty;
    int col = bx * blockDim.x + tx;

    float result = 0;

    // Loop over tiles
    for (int i = 0; i < (width + TILE_WIDTH - 1) / TILE_WIDTH; ++i) // Optimized loop end condition
    {
        // Load tiles into shared memory with boundary checks
        if (row < width && i * TILE_WIDTH + tx < width)
        {
            s_a[ty][tx] = a[row * width + i * TILE_WIDTH + tx];
        }
        else
        {
            s_a[ty][tx] = 0.0f; // Ensure initialization to 0.0f
        }

        if (col < width && i * TILE_WIDTH + ty < width)
        {
            s_b[ty][tx] = b[(i * TILE_WIDTH + ty) * width + col];
        }
        else
        {
            s_b[ty][tx] = 0.0f; // Ensure initialization to 0.0f
        }

        __syncthreads(); // Sync threads after loading tiles

        // Dot product computation
        for (int k = 0; k < TILE_WIDTH; ++k)
        {
            result += s_a[ty][k] * s_b[k][tx];
        }

        __syncthreads(); // Sync threads before loading next tiles
    }

    // Write the result to global memory
    if (row < width && col < width)
    {
        c[row * num + col] = result; // Correct index calculation
    }
}