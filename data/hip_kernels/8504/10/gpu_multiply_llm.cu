#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_DIM 16 // Ensure TILE_DIM is defined

__global__ void gpu_multiply(float* A, float* B, float* C, int ARows, int ACols, int BRows, int BCols, int CRows, int CCols) {

    float CValue = 0;

    int Row = blockIdx.y * TILE_DIM + threadIdx.y;
    int Col = blockIdx.x * TILE_DIM + threadIdx.x;

    __shared__ float As[TILE_DIM][TILE_DIM];
    __shared__ float Bs[TILE_DIM][TILE_DIM];

    // Optimize the loop by reducing condition checks
    for (int k = 0; k < (ACols + TILE_DIM - 1) / TILE_DIM; k++) {

        // Load tile from A matrix
        int tiledACol = k * TILE_DIM + threadIdx.x;
        As[threadIdx.y][threadIdx.x] = (tiledACol < ACols && Row < ARows) ? A[Row * ACols + tiledACol] : 0.0f;

        // Load tile from B matrix
        int tiledBRow = k * TILE_DIM + threadIdx.y;
        Bs[threadIdx.y][threadIdx.x] = (tiledBRow < BRows && Col < BCols) ? B[tiledBRow * BCols + Col] : 0.0f;

        __syncthreads();

        for (int n = 0; n < TILE_DIM; ++n)
            CValue += As[threadIdx.y][n] * Bs[n][threadIdx.x];

        __syncthreads();
    }

    // Write the computed value to C matrix
    if (Row < CRows && Col < CCols) 
        C[Row * CCols + Col] = CValue;
}