#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_SIZE 32

__global__ void OptimizedMMKernel_2_16(float *a, float *b, float *c, int size)
{
    __shared__ float sharedA[16][16];
    __shared__ float sharedB[16][16];

    int tx = threadIdx.x;
    int ty = threadIdx.y;

    int x = blockIdx.x * blockDim.x + tx;
    int y = blockIdx.y * blockDim.y + ty;

    float sum = 0.0f;

    // Use loop unrolling to load data into shared memory and compute the sum
    int tilesPerGrid = size / blockDim.x;
    for (int i = 0; i < tilesPerGrid; ++i)
    {
        sharedA[ty][tx] = a[y * size + i * 16 + tx];
        sharedB[ty][tx] = b[(i * 16 * size) + (ty * size) + x];

        __syncthreads();

        #pragma unroll // Unrolling the loop for performance improvement
        for (int j = 0; j < 16; ++j) {
            sum += sharedA[ty][j] * sharedB[j][tx];
        }

        __syncthreads();
    }

    c[y * size + x] = sum;
}