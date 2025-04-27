#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mat_mult_fixed_dims_kernel(int *mat_a, int *mat_b, int *res) {
    // Shared memory allocation for partial results
    __shared__ int smem[128]; 
    int a_row;
    
    // Traverse rows of matrix A
    for (int row_block = 0; row_block * gridDim.x < A_ROWS; row_block++) {
        a_row = blockIdx.x + (row_block * gridDim.x);
        
        // Traverse columns of matrix B
        for (int b_col = 0; b_col < B_COLS; b_col++) {
            int thread_col;
            smem[threadIdx.x] = 0;  // Initialize shared memory for each thread

            // Perform matrix multiplication and store in shared memory
            for (int thread_i = 0; thread_i * blockDim.x < A_COLS; thread_i++) {
                thread_col = threadIdx.x + (thread_i * blockDim.x);
                if (thread_col < A_COLS) { // Skip load and multiply if out of bounds
                    smem[threadIdx.x] += mat_a[a_row * A_COLS + thread_col] * mat_b[thread_col * B_COLS + b_col];
                }
                __syncthreads();
            }

            // Parallel reduction to compute sum of products
            for (int i = blockDim.x / 2; i > 0; i /= 2) {
                if (threadIdx.x < i) {
                    smem[threadIdx.x] += smem[threadIdx.x + i];
                }
                __syncthreads();
            }

            // Write the result to the output matrix
            if (threadIdx.x == 0) {
                res[a_row * C_COLS + b_col] = smem[0];
            }
        }
    }
}