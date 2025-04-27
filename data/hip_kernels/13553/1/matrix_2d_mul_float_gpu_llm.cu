#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrix_2d_mul_float_gpu(float *A, float *B, float *C, int num_rows_A, int num_cols_A, int num_cols_B) {
    // Create shared memory (per block)
    __shared__ float A_tile[N_THREADS][N_THREADS];
    __shared__ float B_tile[N_THREADS][N_THREADS];
    
    // Block index
    int bx = blockIdx.x; 
    int by = blockIdx.y;
    // Thread index
    int tx = threadIdx.x; 
    int ty = threadIdx.y;

    // Starting points for sub-matrix multiplication
    int aBegin = num_cols_A * N_THREADS * by;
    int aEnd   = aBegin + num_cols_A;
    int aStep  = N_THREADS;
    
    int bBegin = N_THREADS * bx;
    int bStep  = N_THREADS * num_cols_B;

    float sum = 0.0f;
    
    // Loop over all sub-matrices
    for (int a = aBegin, b = bBegin; a < aEnd; a += aStep, b += bStep) {
        // Collaborative loading of A and B sub-matrices into shared memory
        A_tile[ty][tx] = A[a + num_cols_A * ty + tx];
        B_tile[ty][tx] = B[b + num_cols_B * tx + ty];
        
        // Synchronize to ensure data is loaded
        __syncthreads();

        // Calculate partial results using the loaded tiles
        for (int k = 0; k < N_THREADS; ++k) {
            sum += A_tile[ty][k] * B_tile[k][tx];
        }
        
        // Synchronize before loading new sub-matrices
        __syncthreads();
    }

    // Write the result to the output matrix C
    int c = num_cols_B * N_THREADS * by + N_THREADS * bx;
    C[c + num_cols_B * ty + tx] = sum;
}