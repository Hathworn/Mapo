#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_matmul(float* A, float* B, float* C, size_t n)
{
    float sum = 0.0f;

#ifndef MATMUL_USE_SHARED
    int ia = (blockDim.y * blockIdx.y + threadIdx.y) * n;
    int ib = blockDim.x * blockIdx.x + threadIdx.x;
    int ic = ia + ib;

    // Multiply two matrices
    for (int k = 0; k < n; k++)
        sum += A[ia + k] * B[ib + k * n];
#else
    int ia = (blockDim.y * blockIdx.y) * n;
    int ib = blockDim.x * blockIdx.x;
    int tileidx = n * threadIdx.y + threadIdx.x;
    int ic = ia + ib + tileidx;

    __shared__ float As[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float Bs[BLOCK_SIZE][BLOCK_SIZE];

    for (int aoff = 0, boff = 0; aoff < n; aoff += BLOCK_SIZE, boff += BLOCK_SIZE * n)
    {
        // Load the "tile" matrices from global memory to shared memory
        As[threadIdx.y][threadIdx.x] = (aoff + threadIdx.x < n) ? A[ia + aoff + tileidx] : 0.0f;
        Bs[threadIdx.y][threadIdx.x] = (boff + threadIdx.y * n < n * n) ? B[ib + boff + tileidx] : 0.0f;

        // Synchronize to make sure the matrices are loaded
        __syncthreads();

        // Multiply the two matrices
        for (int k = 0; k < BLOCK_SIZE; k++)
            sum += As[threadIdx.y][k] * Bs[k][threadIdx.x];

        // Synchronize to make sure that the preceding computation is done
        __syncthreads();
    }
#endif
    C[ic] = sum; // Write the result
}