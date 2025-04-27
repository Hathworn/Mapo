#include "hip/hip_runtime.h"
#include "includes.h"
#define THREADS_PER_BLOCK 256

__global__ void MatrixMul(float *Md, float *Nd, float *Pd, const int WIDTH) {
    // Compute column and row for the element
    int COL = threadIdx.x + blockIdx.x * blockDim.x;
    int ROW = threadIdx.y + blockIdx.y * blockDim.y;

    if (ROW < WIDTH && COL < WIDTH) {
        float Pvalue = 0; // Accumulator for the current element
        // Use shared memory for partial submatrices
        __shared__ float Mds[THREADS_PER_BLOCK][THREADS_PER_BLOCK];
        __shared__ float Nds[THREADS_PER_BLOCK][THREADS_PER_BLOCK];

        // Loop over phases
        for (int ph = 0; ph < WIDTH / THREADS_PER_BLOCK; ++ph) {
            // Load Md and Nd tiles into shared memory
            Mds[threadIdx.y][threadIdx.x] = Md[ROW * WIDTH + (ph * THREADS_PER_BLOCK + threadIdx.x)];
            Nds[threadIdx.y][threadIdx.x] = Nd[(ph * THREADS_PER_BLOCK + threadIdx.y) * WIDTH + COL];
            __syncthreads();

            // Multiply tiles
            for (int k = 0; k < THREADS_PER_BLOCK; ++k) {
                Pvalue += Mds[threadIdx.y][k] * Nds[k][threadIdx.x];
            }
            __syncthreads();
        }
        // Write back the result
        Pd[ROW * WIDTH + COL] = Pvalue;
    }
}