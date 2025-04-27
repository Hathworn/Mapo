#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multMatriz(float *da, float *db, float *dc, int num) {
    // Utilize shared memory to reduce global memory accesses.
    __shared__ float tileA[32][32];
    __shared__ float tileB[32][32];

    float sum = 0.0f;
    int row = threadIdx.y + blockIdx.y * blockDim.y;
    int col = threadIdx.x + blockIdx.x * blockDim.x;

    // Loop over tiles.
    for (int m = 0; m < (num + 31) / 32; ++m) {
        // Load a tile from matrix A and B into shared memory.
        if (row < num && m * 32 + threadIdx.x < num)
            tileA[threadIdx.y][threadIdx.x] = da[row * num + m * 32 + threadIdx.x];
        else
            tileA[threadIdx.y][threadIdx.x] = 0.0f;

        if (col < num && m * 32 + threadIdx.y < num)
            tileB[threadIdx.y][threadIdx.x] = db[(m * 32 + threadIdx.y) * num + col];
        else
            tileB[threadIdx.y][threadIdx.x] = 0.0f;

        __syncthreads();

        // Compute partial product for the current tile.
        for (int k = 0; k < 32; ++k) {
            sum += tileA[threadIdx.y][k] * tileB[k][threadIdx.x];
        }
        __syncthreads();
    }

    // Write the result to the output matrix.
    if (row < num && col < num) {
        dc[row * num + col] = sum;
    }
}