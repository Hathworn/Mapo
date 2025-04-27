#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpuMM(float *A, float *B, float *C, int N)
{
    // Allocate shared memory for tiles of A and B
    __shared__ float tileA[32][32];
    __shared__ float tileB[32][32];

    // Calculate the row and column index for C
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    float sum = 0.0;

    // Loop over the tiles of A and B
    for (int t = 0; t < N/32; ++t) {
        // Load data into shared memory
        tileA[threadIdx.y][threadIdx.x] = A[row * N + t * 32 + threadIdx.x];
        tileB[threadIdx.y][threadIdx.x] = B[(t * 32 + threadIdx.y) * N + col];

        // Synchronize to ensure all data is loaded
        __syncthreads();

        // Perform computation on the tile
        for (int n = 0; n < 32; ++n) {
            sum += tileA[threadIdx.y][n] * tileB[n][threadIdx.x];
        }

        // Synchronize to make sure that computation is done before loading new tiles
        __syncthreads();
    }

    // Write the result to C
    if (row < N && col < N)
        C[row * N + col] = sum;
}