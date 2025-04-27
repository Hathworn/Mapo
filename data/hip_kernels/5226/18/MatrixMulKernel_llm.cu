#include "hip/hip_runtime.h"
#include "includes.h"
#define BLOCK_SIZE 16

__global__ void MatrixMulKernel(float* M, float* N, float* P, int Width) {
    // Calculate tile starting points and steps
    int Mstart = Width * BLOCK_SIZE * blockIdx.y;
    int Nstart = BLOCK_SIZE * blockIdx.x;
    int mstep = BLOCK_SIZE * Width;
    int nstep = BLOCK_SIZE;
    float temp = 0;

    for (int m = Mstart, n = Nstart; m < Mstart + Width; m += mstep, n += nstep) {
        __shared__ float Ms[BLOCK_SIZE][BLOCK_SIZE];
        __shared__ float Ns[BLOCK_SIZE][BLOCK_SIZE];

        // Load data into shared memory avoiding bank conflicts
        int row = threadIdx.y;
        int col = threadIdx.x;
        Ms[row][col] = M[m + Width * row + col];
        Ns[row][col] = N[n + Width * row + col];
        __syncthreads();

        // Perform multiplication using shared memory
        for (int i = 0; i < BLOCK_SIZE; ++i) {
            temp += Ms[row][i] * Ns[i][col];
        }
        __syncthreads();
    }

    // Write the result to the output matrix
    int Pidx = Width * BLOCK_SIZE * blockIdx.y + BLOCK_SIZE * blockIdx.x + Width * threadIdx.y + threadIdx.x;
    P[Pidx] = temp;
}