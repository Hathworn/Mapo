#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_SIZE SIZE

__global__ void KernelMM(int N, int M, int P, float *A, float *B, float *C) {

    __shared__ float sA[TILE_SIZE][TILE_SIZE];
    __shared__ float sB[TILE_SIZE][TILE_SIZE];

    int bx = blockIdx.x;  
    int by = blockIdx.y;
    int tx = threadIdx.x; 
    int ty = threadIdx.y;
    int row = by * TILE_SIZE + ty;
    int col = bx * TILE_SIZE + tx;

    float tmp = 0.0;
    
    // Optimize: Unroll loop for better performance
    for (int m = 0; m < P; m += TILE_SIZE) {
        if (row < N && (m + tx) < P)
            sA[ty][tx] = A[row * P + m + tx];     
        else
            sA[ty][tx] = 0.0;

        if (col < M && (m + ty) < P)
            sB[ty][tx] = B[(m + ty) * M + col];
        else
            sB[ty][tx] = 0.0;

        __syncthreads();

        for (int k = 0; k < TILE_SIZE; ++k) 
            tmp += sA[ty][k] * sB[k][tx];

        __syncthreads();
    }
    
    if (row < N && col < M)
        C[row * M + col] = tmp;
}