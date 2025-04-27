#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMultiKernel(float *C, float *A, float *B, int Width) {
    const int BLOCK_SIZE = 16; // NOTE: This must be similar to line 338

    // block and thread indexes
    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Dividing the matrices into sub sections
    int a_begin = Width * BLOCK_SIZE * by;
    int a_end = a_begin + Width - 1;
    int a_step = BLOCK_SIZE;

    int b_begin = BLOCK_SIZE * bx;
    int b_step = BLOCK_SIZE * Width;

    float temp_c = 0;

    // loop through the submatrices
    for (int a = a_begin, b = b_begin; a <= a_end; a += a_step, b += b_step) {
        // sub matrices
        __shared__ float sub_a[BLOCK_SIZE][BLOCK_SIZE];
        __shared__ float sub_b[BLOCK_SIZE][BLOCK_SIZE];

        // Optimize memory accesses for A and B
        int a_index = a + Width * ty + tx;
        int b_index = b + Width * ty + tx;

        sub_a[ty][tx] = A[a_index];
        sub_b[ty][tx] = B[b_index]; // Correct access pattern for B

        __syncthreads();

        // Sub matrix multiplication with pragma unroll
        #pragma unroll
        for (int k = 0; k < BLOCK_SIZE; ++k) {
            temp_c += sub_a[ty][k] * sub_b[k][tx];
        }
        __syncthreads();
    }

    // Store the computed value in the correct output position
    int c = Width * BLOCK_SIZE * by + BLOCK_SIZE * bx;
    C[c + Width * ty + tx] = temp_c;
}