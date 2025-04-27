#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_SIZE 32 // Define tile size as a macro

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
    
    // Loop tiling for shared memory use
    for (int m = 0; m < P; m += TILE_SIZE) {
        // Coalesced loading of A and B into shared memory
        if (row < N && m + tx < P) 
            sA[ty][tx] = A[row * P + m + tx];
        else 
            sA[ty][tx] = 0.0;
        
        if (col < M && m + ty < P) 
            sB[ty][tx] = B[(m + ty) * M + col];
        else 
            sB[ty][tx] = 0.0;

        __syncthreads(); // Synchronize to ensure all data is loaded

        // Perform the multiplication for the partial tile
        for (int k = 0; k < TILE_SIZE; k++) {
            tmp += sA[ty][k] * sB[k][tx];
        }
        
        __syncthreads(); // Synchronize before loading new tile
    }
    
    if (row < N && col < M) // Ensure within bounds before storing the result
        C[row * M + col] = tmp;
}