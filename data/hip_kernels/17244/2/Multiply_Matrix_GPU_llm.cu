#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Multiply_Matrix_GPU(float* A, float* B, float* C, int BLOCK_SIZE, int N) {
    // Block index
    int bx = blockIdx.x;
    int by = blockIdx.y;

    // Thread index
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    float total = 0.0;
    int ia = N * BLOCK_SIZE * by + ty;  // Offset for matrix A
    int ib = BLOCK_SIZE * bx + tx;      // Offset for matrix B

    // Use a wider stride for the loop to ensure coalesced access
    for (int k = 0; k < N; k += BLOCK_SIZE) {
        // Load a block strip of A and B into shared memory
        __shared__ float As[BLOCK_SIZE];
        __shared__ float Bs[BLOCK_SIZE];

        // Each thread loads one element into shared memory
        As[ty] = A[ia + k + ty * N];
        Bs[tx] = B[ib + k * N];

        __syncthreads(); // Ensure all data is loaded into shared memory

        // Multiply and accumulate
        for (int n = 0; n < BLOCK_SIZE; ++n) {
            total += As[n] * Bs[n];
        }

        __syncthreads(); // Ensure all calculations are done before next load
    }

    int ic = N * BLOCK_SIZE * by + BLOCK_SIZE * bx;
    // Store the result in matrix C
    C[ic + N * ty + tx] = total;
}