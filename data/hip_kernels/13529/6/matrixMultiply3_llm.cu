```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16 // Add macro for TILE_WIDTH if not defined elsewhere

__global__ void matrixMultiply3(float* A, float* C, int size) {

    float CValue = 0;

    int Row = blockIdx.y * TILE_WIDTH + threadIdx.y;
    int Col = blockIdx.x * TILE_WIDTH + threadIdx.x;

    __shared__ float As[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Bs[TILE_WIDTH][TILE_WIDTH]; // Separate shared memory for B

    for (int k = 0; k < (TILE_WIDTH + size - 1) / TILE_WIDTH; k++) {

        // Load As from global to shared memory
        if (k * TILE_WIDTH + threadIdx.x < size && Row < size)
            As[threadIdx.y][threadIdx.x] = A[Row * size + k * TILE_WIDTH + threadIdx.x];
        else
            As[threadIdx.y][threadIdx.x] = 0.0;

        // Load Bs from global to shared memory
        if (k * TILE_WIDTH + threadIdx.y < size && Col < size) 
            Bs[threadIdx.y][threadIdx.x] = A[(k*TILE_WIDTH + threadIdx.y) * size + Col];
        else
            Bs[threadIdx.y][threadIdx.x] = 0.0;

        __syncthreads(); // Ensure all threads have loaded data to shared memory

        // Collaborative computation
        for (int n = 0; n < TILE_WIDTH; ++n)
            CValue += As[threadIdx.y][n] * Bs[n][threadIdx.x];

        __syncthreads(); // Ensure computation is done before next iteration
    }

    // Write result to global memory
    if (Row < size && Col < size)
        C[Row * size + Col] = CValue;
}