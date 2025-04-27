#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16 // Define tile width for shared memory optimization

__global__ void sgemm_kernel_B(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    // Define shared memory
    __shared__ float shared_A[TILE_WIDTH][TILE_WIDTH];
    __shared__ float shared_B[TILE_WIDTH][TILE_WIDTH];

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int col = blockIdx.x * TILE_WIDTH + tx;
    int row = blockIdx.y * TILE_WIDTH + ty;

    float sum = 0.0f;

    // Loop over tiles
    for (int t = 0; t < (K + TILE_WIDTH - 1) / TILE_WIDTH; ++t) {
        // Load data into shared memory
        if (row < N && t * TILE_WIDTH + tx < K) {
            shared_A[ty][tx] = A[row * K + t * TILE_WIDTH + tx];
        } else {
            shared_A[ty][tx] = 0.0f;
        }

        if (col < M && t * TILE_WIDTH + ty < K) {
            shared_B[ty][tx] = B[(t * TILE_WIDTH + ty) * M + col];
        } else {
            shared_B[ty][tx] = 0.0f;
        }

        __syncthreads(); // Wait for all threads to finish using shared memory

        // Accumulate partial sums
        for (int i = 0; i < TILE_WIDTH; ++i) {
            sum += shared_A[ty][i] * shared_B[i][tx];
        }

        __syncthreads(); // Wait for all threads before loading new data
    }

    // Store the result back to global memory
    if (row < N && col < M) {
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
    }
}