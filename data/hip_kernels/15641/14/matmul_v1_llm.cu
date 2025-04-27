#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matmul_v1(float* a,float* b,float* c, int n){
// C(nxn) = A(nxn) * B(nxn);

__shared__ float A[TILE_SIZE][TILE_SIZE+1];
__shared__ float B[TILE_SIZE][TILE_SIZE+1];

int bx = blockIdx.x;
int by = blockIdx.y;
int tx = threadIdx.x;
int ty = threadIdx.y;

int i = bx*TILE_SIZE+tx;
int j = by*TILE_SIZE+ty;

// Reset shared memory values
A[ty][tx] = 0;
B[ty][tx] = 0;

if(i >= n || j >= n) return;

float c_ij = 0;
for(int m = 0; m < (n + TILE_SIZE - 1) / TILE_SIZE; m++){

    // Load tile into shared memory if within bounds
    if (tx + m*TILE_SIZE < n && j < n)
        A[ty][tx] = a[j*n + m*TILE_SIZE + tx];
    if (ty + m*TILE_SIZE < n && i < n)
        B[ty][tx] = b[(m*TILE_SIZE + ty)*n + i];

    __syncthreads();

    // Compute on loaded tiles
    for(int k = 0; k < TILE_SIZE; k++)
        c_ij += A[ty][k] * B[k][tx];
    __syncthreads();
}

// Ensure within result bounds before writing
if (i < n && j < n)
    c[n*j+i] = c_ij;

}