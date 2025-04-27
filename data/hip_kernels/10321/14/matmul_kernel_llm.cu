#include "hip/hip_runtime.h"
#include "includes.h"
#define TILE_WIDTH 16

__global__ void matmul_kernel(float *C, float *A, float *B) {
    __shared__ float shared_A[TILE_WIDTH][TILE_WIDTH]; // Shared memory for A
    __shared__ float shared_B[TILE_WIDTH][TILE_WIDTH]; // Shared memory for B

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int x = blockIdx.x * TILE_WIDTH + tx;
    int y = blockIdx.y * TILE_WIDTH + ty;

    float sum = 0.0;

    for (int m = 0; m < WIDTH / TILE_WIDTH; ++m) {
        // Load tiles into shared memory
        if (y < WIDTH && (m * TILE_WIDTH + tx) < WIDTH)
            shared_A[ty][tx] = A[y * WIDTH + m * TILE_WIDTH + tx];
        else
            shared_A[ty][tx] = 0.0;

        if (x < WIDTH && (m * TILE_WIDTH + ty) < WIDTH)
            shared_B[ty][tx] = B[(m * TILE_WIDTH + ty) * WIDTH + x];
        else
            shared_B[ty][tx] = 0.0;

        __syncthreads(); // Wait for both tiles to be loaded

        // Multiply the two tiles
        for (int k = 0; k < TILE_WIDTH; ++k) {
            sum += shared_A[ty][k] * shared_B[k][tx];
        }

        __syncthreads(); // Ensure all threads are done using current tiles
    }

    if (y < WIDTH && x < WIDTH) // Ensure C index is within bounds
        C[y * WIDTH + x] = sum;
}