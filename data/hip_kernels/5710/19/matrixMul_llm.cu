#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16 // Assuming TILE_WIDTH is defined here

__global__ void matrixMul(float* A, float* B, float* C, int width)
{
    __shared__ float As[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Bs[TILE_WIDTH][TILE_WIDTH];

    int row = blockIdx.y * TILE_WIDTH + threadIdx.y;
    int col = blockIdx.x * TILE_WIDTH + threadIdx.x;
    float c_val = 0.0f;

    // Loop over each sub-matrix required to compute Csub
    for(int i = 0; i < width / TILE_WIDTH; ++i)
    {
        // Load tiles into shared memory
        int a_index = row * width + i * TILE_WIDTH + threadIdx.x;
        int b_index = (i * TILE_WIDTH + threadIdx.y) * width + col;

        As[threadIdx.y][threadIdx.x] = A[a_index];
        Bs[threadIdx.y][threadIdx.x] = B[b_index];

        __syncthreads();

        // Compute dot product for current tile
        #pragma unroll
        for(int k = 0; k < TILE_WIDTH; ++k)
        {
            c_val += As[threadIdx.y][k] * Bs[k][threadIdx.x];
        }

        __syncthreads();
    }

    // Write the result
    int c_index = row * width + col;
    C[c_index] = c_val;
}