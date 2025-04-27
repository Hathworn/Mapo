#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void matrixMultiplicationKernel(float *A, float* B, float* C, int a, int b, int d) {
    // Block index
    int bx = blockIdx.x;
    int by = blockIdx.y;

    // Thread index
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    int ROW = by * blockDim.y + ty;
    int COL = bx * blockDim.x + tx;

    // Check if the thread is within matrix dimensions
    if (ROW < a && COL < d) {
        __shared__ float As[BLOCK_SIZE][BLOCK_SIZE];
        __shared__ float Bs[BLOCK_SIZE][BLOCK_SIZE];

        float Cv = 0;

        int aBegin = a * BLOCK_SIZE * by;
        int aStep = BLOCK_SIZE;
        int aEnd = aBegin + a - 1;

        int bBegin = BLOCK_SIZE * bx;
        int bStep = BLOCK_SIZE * d;

        for (int a = aBegin, b = bBegin; a <= aEnd; a += aStep, b += bStep) {
            // Load data from global to shared memory
            if (a + tx < a * (by + 1) && a / aStep < aEnd / aStep + 1) {
                As[ty][tx] = A[a + a * ty + tx];
            } else {
                As[ty][tx] = 0.0;
            }

            if (b + BLOCK_SIZE * ty + tx < b + d) {
                Bs[ty][tx] = B[b + BLOCK_SIZE * ty + tx];
            } else {
                Bs[ty][tx] = 0.0;
            }

            __syncthreads();

            // Accumulate results
            for (int k = 0; k < BLOCK_SIZE; ++k) {
                Cv += As[ty][k] * Bs[k][tx];
            }

            __syncthreads();
        }

        // Write results back to global memory
        if (ROW < a && COL < d) {
            C[ROW * d + COL] = Cv;
        }
    }
}