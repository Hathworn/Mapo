#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulKernel(float* M, float* N, float* P, int Width) {
    // Determine starting points for the tiles
    int Mstart = Width * BLOCK_SIZE * blockIdx.y;
    int Nstart = BLOCK_SIZE * blockIdx.x;
    float temp = 0;

    // Loop through tiles
    for (int m = Mstart, n = Nstart; m <= Mstart + Width - 1; m += BLOCK_SIZE, n += BLOCK_SIZE * Width) {
        // Load data into shared memory using coalesced access
        __shared__ float Ms[BLOCK_SIZE][BLOCK_SIZE];
        __shared__ float Ns[BLOCK_SIZE][BLOCK_SIZE];

        Ms[threadIdx.y][threadIdx.x] = M[m + Width * threadIdx.y + threadIdx.x];
        Ns[threadIdx.y][threadIdx.x] = N[n + Width * threadIdx.y + threadIdx.x];
        
        __syncthreads();

        // Use unrolled loop for better ILP (Instruction-Level Parallelism)
        #pragma unroll
        for (int i = 0; i < BLOCK_SIZE; ++i) {
            temp += Ms[threadIdx.y][i] * Ns[i][threadIdx.x];
        }
        
        __syncthreads();
    }

    // Store the result back to the matrix P
    P[Width * BLOCK_SIZE * blockIdx.y + BLOCK_SIZE * blockIdx.x + Width * threadIdx.y + threadIdx.x] = temp;
}