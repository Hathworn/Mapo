#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Kernel11(int N, int M, int P, float *A, float *B, float *C) {

// Use shared memory to reduce global memory access
__shared__ float sA[SIZE][SIZE];
__shared__ float sB[SIZE][SIZE];

int bx = blockIdx.x;  
int by = blockIdx.y;
int tx = threadIdx.x; 
int ty = threadIdx.y;
int row = by * SIZE + ty;
int col = bx * SIZE + tx;
int m, k;

// Initialize temporary result
float tmp = 0.0;

// Improve memory coalescing by aligning block iteration
for (m = 0; m < P; m += SIZE) {
    // Load data into shared memory if within bounds
    if (row < N && (m+tx) < P) 
        sA[ty][tx] = A[row * P + m + tx]; 
    else 
        sA[ty][tx] = 0.0;

    if (col < M && (m+ty) < P) 
        sB[ty][tx] = B[(m+ty) * M + col]; 
    else 
        sB[ty][tx] = 0.0;
    __syncthreads();

    // Perform computation for the tile
    for (k = 0; k < SIZE; k++) {
        tmp += sA[ty][k] * sB[k][tx];
    }
    __syncthreads();
}

// Store the result if within the matrix bounds
if ((row < N) && (col < M)) 
    C[row * M + col] = tmp;

}