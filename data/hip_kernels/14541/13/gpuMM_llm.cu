#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpuMM(float *A, float *B, float *C, int N)
{
    // Matrix multiplication for NxN matrices C=A*B
    // Each thread computes a block-tile of C using shared memory
    __shared__ float Asub[32][32]; // Shared memory for sub-matrix of A
    __shared__ float Bsub[32][32]; // Shared memory for sub-matrix of B

    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    float sum = 0.f;

    for (int tile = 0; tile < (N + 31) / 32; ++tile) {
        // Load elements into shared memory if within bounds
        if (tile * 32 + threadIdx.x < N && row < N)
            Asub[threadIdx.y][threadIdx.x] = A[row * N + tile * 32 + threadIdx.x];
        else
            Asub[threadIdx.y][threadIdx.x] = 0.0f;

        if (tile * 32 + threadIdx.y < N && col < N)
            Bsub[threadIdx.y][threadIdx.x] = B[(tile * 32 + threadIdx.y) * N + col];
        else
            Bsub[threadIdx.y][threadIdx.x] = 0.0f;

        __syncthreads();

        // Compute partial product for this tile
        for (int n = 0; n < 32; ++n)
            sum += Asub[threadIdx.y][n] * Bsub[n][threadIdx.x];

        __syncthreads();
    }

    // Store result if within bounds
    if (row < N && col < N)
        C[row * N + col] = sum;
}