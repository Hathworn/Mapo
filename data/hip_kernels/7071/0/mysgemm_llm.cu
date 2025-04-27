#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_SZ 16

__global__ void mysgemm(int m, int n, int k, const float *A, const float *B, float* C) {

/********************************************************************
*
* Compute C = A x B
*   where A is a (m x k) matrix
*   where B is a (k x n) matrix
*   where C is a (m x n) matrix
*
* Use shared memory for tiling
*
********************************************************************/

unsigned int TiRow = threadIdx.y;
unsigned int TiCol = threadIdx.x;
unsigned int row = blockIdx.y * blockDim.y + threadIdx.y;
unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;

__shared__ float As[TILE_SZ][TILE_SZ];
__shared__ float Bs[TILE_SZ][TILE_SZ];

float sum = 0.0f;

for(unsigned int TiNum = 0; TiNum < (k+TILE_SZ-1)/TILE_SZ; TiNum++){
    // Load tile from A
    if(row < m && (TiNum * TILE_SZ + TiCol) < k)
        As[TiRow][TiCol] = A[row * k + TiNum * TILE_SZ + TiCol];
    else
        As[TiRow][TiCol] = 0.0f;

    // Load tile from B
    if((TiNum * TILE_SZ + TiRow) < k && col < n)
        Bs[TiRow][TiCol] = B[(TiNum * TILE_SZ + TiRow) * n + col];
    else
        Bs[TiRow][TiCol] = 0.0f;

    __syncthreads();

    // Compute tile multiplication
    for(unsigned int TiElem = 0; TiElem < TILE_SZ; ++TiElem)
        sum += As[TiRow][TiElem] * Bs[TiElem][TiCol];

    __syncthreads();
}

// Store result in C
if (row < m && col < n)
    C[row * n + col] = sum;
}