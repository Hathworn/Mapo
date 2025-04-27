#include "hip/hip_runtime.h"
#include "includes.h"

/// Tile size used by the OptimizedMMKernel
#define TILE_SIZE 32

/// Optimized matrix multiplication CUDA Kernel
__global__ void OptimizedMMKernel_2_8(float *a, float *b, float *c, int size)
{
    // Create shared matrices for rows of A and columns of B
    __shared__ float sharedA[8][8];
    __shared__ float sharedB[8][8];

    int tx = threadIdx.x;
    int ty = threadIdx.y;

    int x = blockIdx.x * blockDim.x + tx;
    int y = blockIdx.y * blockDim.y + ty;

    float sum = 0;

    // Improved loop unrolling for accessing shared memory
    int tilesPerGrid = size / blockDim.x;
    for (int i = 0; i < tilesPerGrid; i++)
    {
        // Each thread loads element into A and B
        sharedA[ty][tx] = a[(y * size) + (i * 8) + tx];
        sharedB[ty][tx] = b[(i * 8 * size) + (ty * size) + x];

        // Wait for all threads to load each section of the shared matrix
        __syncthreads();

        #pragma unroll
        for (int k = 0; k < 8; ++k)
        {
            sum += sharedA[ty][k] * sharedB[k][tx];
        }

        // Wait for all threads to compute their partial sum before loading the next
        __syncthreads();
    }

    // Store the full sum as the result
    c[y * size + x] = sum;
}