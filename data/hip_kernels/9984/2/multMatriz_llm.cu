#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multMatriz(float *da, float *db, float *dc, int num) {
    // Use shared memory for faster data access
    __shared__ float tileA[32][32];
    __shared__ float tileB[32][32];

    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    float sum = 0;

    // Loop over tiles
    for (int m = 0; m < (num + blockDim.x - 1) / blockDim.x; ++m) {
        // Load data into shared memory
        if (row < num && m * blockDim.x + threadIdx.x < num) 
            tileA[threadIdx.y][threadIdx.x] = da[row * num + m * blockDim.x + threadIdx.x];
        else 
            tileA[threadIdx.y][threadIdx.x] = 0.0f;

        if (col < num && m * blockDim.y + threadIdx.y < num) 
            tileB[threadIdx.y][threadIdx.x] = db[(m * blockDim.y + threadIdx.y) * num + col];
        else 
            tileB[threadIdx.y][threadIdx.x] = 0.0f;

        // Wait for all threads to load their data
        __syncthreads();

        // Compute partial sums
        for (int e = 0; e < blockDim.x; ++e) {
            sum += tileA[threadIdx.y][e] * tileB[e][threadIdx.x];
        }

        // Wait for all threads to complete computation
        __syncthreads();
    }

    // Write result to global memory
    if (row < num && col < num) {
        dc[row * num + col] = sum;
    }
}