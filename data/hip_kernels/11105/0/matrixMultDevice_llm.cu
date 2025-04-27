#include "hip/hip_runtime.h"
#include "includes.h"

#define TAM 2

__global__ void matrixMultDevice(float* d_A, float* d_B, float* d_C, int width) {
    // Use shared memory to optimize memory access
    __shared__ float shared_A[TAM][TAM];
    __shared__ float shared_B[TAM][TAM];

    int Row = blockDim.y * blockIdx.y + threadIdx.y;
    int Col = blockDim.x * blockIdx.x + threadIdx.x;

    float ans = 0.0;

    // Loop over the tiles of the input arrays
    for (int tileIdx = 0; tileIdx < gridDim.x; ++tileIdx) {
        // Collaboratively load tiles into shared memory
        if (Row < width && tileIdx * TAM + threadIdx.x < width)
            shared_A[threadIdx.y][threadIdx.x] = d_A[Row * width + tileIdx * TAM + threadIdx.x];
        else
            shared_A[threadIdx.y][threadIdx.x] = 0.0;

        if (Col < width && tileIdx * TAM + threadIdx.y < width)
            shared_B[threadIdx.y][threadIdx.x] = d_B[(tileIdx * TAM + threadIdx.y) * width + Col];
        else
            shared_B[threadIdx.y][threadIdx.x] = 0.0;

        __syncthreads();

        // Multiply the two matrices together
        for (int k = 0; k < TAM; ++k) {
            ans += shared_A[threadIdx.y][k] * shared_B[k][threadIdx.x];
        }

        __syncthreads();
    }

    // Write the block sub-matrix to global memory
    if (Row < width && Col < width) {
        d_C[Row * width + Col] = ans;
    }
}