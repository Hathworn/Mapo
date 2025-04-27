#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matmul(float* A, float* B, float* C, int ARows, int ACols, int BRows, int BCols, int CRows, int CCols) {
    // Initialize shared memory to store sub-matrices
    __shared__ float As[16][16];
    __shared__ float Bs[16][16];

    float CValue = 0;

    int Row = blockIdx.y * 16 + threadIdx.y;
    int Col = blockIdx.x * 16 + threadIdx.x;

    for (int k = 0; k < (ACols + 16 - 1) / 16; k++) {
        // Load subsets into shared memory with bounds checking
        if (Row < ARows && (k * 16 + threadIdx.x) < ACols) {
            As[threadIdx.y][threadIdx.x] = A[Row * ACols + k * 16 + threadIdx.x];
        } else {
            As[threadIdx.y][threadIdx.x] = 0.0;
        }

        if (Col < BCols && (k * 16 + threadIdx.y) < BRows) {
            Bs[threadIdx.y][threadIdx.x] = B[(k * 16 + threadIdx.y) * BCols + Col];
        } else {
            Bs[threadIdx.y][threadIdx.x] = 0.0;
        }

        __syncthreads();  // Synchronize threads

        for (int n = 0; n < 16; ++n) {
            CValue += As[threadIdx.y][n] * Bs[n][threadIdx.x];
        }

        __syncthreads();  // Synchronize threads
    }

    // Write back the result if within bounds
    if (Row < CRows && Col < CCols) {
        C[Row * CCols + Col] = CValue;
    }
}