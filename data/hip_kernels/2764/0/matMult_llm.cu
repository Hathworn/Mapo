#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE  32
#define N           3200

__global__ void matMult(float* a, float* b, int n, float* c)
{
    // Cache the sub-matrix of A and B in shared memory
    __shared__ float As[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float Bs[BLOCK_SIZE][BLOCK_SIZE];

    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    float sum = 0.0f;

    // Loop over the A and B tiles required to compute the block sub-matrix
    for (int m = 0; m < (n + BLOCK_SIZE - 1) / BLOCK_SIZE; ++m) {
        // Load A and B tiles into shared memory
        if (m * BLOCK_SIZE + tx < n && by * BLOCK_SIZE + ty < n)
            As[ty][tx] = a[(by * BLOCK_SIZE + ty) * n + m * BLOCK_SIZE + tx];
        else
            As[ty][tx] = 0.0f;

        if (m * BLOCK_SIZE + ty < n && bx * BLOCK_SIZE + tx < n)
            Bs[ty][tx] = b[(m * BLOCK_SIZE + ty) * n + bx * BLOCK_SIZE + tx];
        else
            Bs[ty][tx] = 0.0f;

        __syncthreads();

        // Multiply the two matrices together
        for (int k = 0; k < BLOCK_SIZE; ++k)
            sum += As[ty][k] * Bs[k][tx];

        __syncthreads();
    }

    // Write the block sub-matrix to device memory
    if (by * BLOCK_SIZE + ty < n && bx * BLOCK_SIZE + tx < n)
        c[(by * BLOCK_SIZE + ty) * n + bx * BLOCK_SIZE + tx] = sum;
}