#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matmul(float* A, float* B, float* C, int ARows, int ACols, int BRows, int BCols, int CRows, int CCols) {

    // Load tile dimensions into shared memory
    __shared__ float As[16][16];
    __shared__ float Bs[16][16];

    float CValue = 0;
    int Row = blockIdx.y * 16 + threadIdx.y;
    int Col = blockIdx.x * 16 + threadIdx.x;

    for (int k = 0; k < (ACols - 1) / 16 + 1; ++k) {

        // Collaborative loading of tiles into shared memory
        if (Row < ARows && k * 16 + threadIdx.x < ACols)
            As[threadIdx.y][threadIdx.x] = A[Row * ACols + k * 16 + threadIdx.x];
        else
            As[threadIdx.y][threadIdx.x] = 0.0f;

        if (k * 16 + threadIdx.y < BRows && Col < BCols)
            Bs[threadIdx.y][threadIdx.x] = B[(k * 16 + threadIdx.y) * BCols + Col];
        else
            Bs[threadIdx.y][threadIdx.x] = 0.0f;

        __syncthreads();

        // Matrix multiplication within block
        for (int n = 0; n < 16; ++n)
            CValue += As[threadIdx.y][n] * Bs[n][threadIdx.x];

        __syncthreads();
    }

    // Store the result back to global memory
    if (Row < CRows && Col < CCols)
        C[Row * CCols + Col] = CValue;
}