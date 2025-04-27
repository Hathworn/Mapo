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
    for (int k = 0; k < n; k += BLOCK_SIZE) {
        sum += A[ia + k] * B[ib + k * n];
    }
#else
    int ia = (blockDim.y * blockIdx.y) * n;
    int ib = blockDim.x * blockIdx.x;
    int tileidx = n * threadIdx.y + threadIdx.x;
    int ic = ia + ib + tileidx;

    __shared__ float As[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float Bs[BLOCK_SIZE][BLOCK_SIZE];

    // Iterate over tiles efficiently
    for (int tileBase = 0; tileBase < n; tileBase += BLOCK_SIZE) {
        // Load tiles into shared memory
        As[threadIdx.y][threadIdx.x] = A[ia + tileBase + tileidx];
        Bs[threadIdx.y][threadIdx.x] = B[ib + tileBase * n + tileidx];
        
        __syncthreads(); // Ensure the tiles are loaded before computing
        
        // Perform multiplication on tiles
        for (int k = 0; k < BLOCK_SIZE; k++) {
            sum += As[threadIdx.y][k] * Bs[k][threadIdx.x];
        }
        
        __syncthreads(); // Ensure computations are finished before next iteration
    }
#endif
    
    C[ic] = sum; // Write result to global memory
}