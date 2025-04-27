#include "hip/hip_runtime.h"
#include "includes.h"

#define IDX2C(i,j,ld) (((i)*(ld))+(j))

__global__ void matrixMultiplicationKernel(float* A, float* B, float* C, int N)
{
    int ROW = blockIdx.y * blockDim.y + threadIdx.y;
    int COL = blockIdx.x * blockDim.x + threadIdx.x;
    float tmpSum = 0.0f;

    if (ROW < N && COL < N) {
        // Optimize using shared memory
        __shared__ float As[16][16]; // Assuming block size of 16x16 or adjust as needed
        __shared__ float Bs[16][16];

        for (int tileIdx = 0; tileIdx < (N + 15) / 16; ++tileIdx) {
            // Load data into shared memory
            if (ROW < N && (tileIdx * 16 + threadIdx.x) < N)
                As[threadIdx.y][threadIdx.x] = A[ROW * N + tileIdx * 16 + threadIdx.x];
            else 
                As[threadIdx.y][threadIdx.x] = 0.0f;

            if (COL < N && (tileIdx * 16 + threadIdx.y) < N)
                Bs[threadIdx.y][threadIdx.x] = B[(tileIdx * 16 + threadIdx.y) * N + COL];
            else
                Bs[threadIdx.y][threadIdx.x] = 0.0f;

            __syncthreads();

            // Compute the partial result
            for (int i = 0; i < 16; ++i)
                tmpSum += As[threadIdx.y][i] * Bs[i][threadIdx.x];

            __syncthreads();
        }

        C[ROW * N + COL] = tmpSum;
    }
}