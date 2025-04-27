#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpuMM(float *A, float *B, float *C, int N)
{
    // Matrix multiplication for NxN matrices C=A*B
    // Optimize thread computation using shared memory
    __shared__ float sharedA[TILE_SIZE][TILE_SIZE];
    __shared__ float sharedB[TILE_SIZE][TILE_SIZE];

    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    float sum = 0.f;

    for (int i = 0; i < N; i += TILE_SIZE)
    {
        // Load data into shared memory
        sharedA[threadIdx.y][threadIdx.x] = A[row * N + i + threadIdx.x];
        sharedB[threadIdx.y][threadIdx.x] = B[(i + threadIdx.y) * N + col];
        
        __syncthreads(); // Synchronize threads
        
        // Perform multiplication
        for (int k = 0; k < TILE_SIZE; ++k)
        {
            sum += sharedA[threadIdx.y][k] * sharedB[k][threadIdx.x];
        }

        __syncthreads(); // Synchronize threads
    }

    C[row * N + col] = sum;
}