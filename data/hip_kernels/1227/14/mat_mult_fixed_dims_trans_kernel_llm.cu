#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mat_mult_fixed_dims_trans_kernel(int *mat_a, int *mat_b, int *res) {
    int B_TRANS_ROWS = B_COLS;
    int B_TRANS_COLS = B_ROWS;
    __shared__ int smem[128];

    for (int row_block = 0; row_block * gridDim.x < A_ROWS; row_block++) {
        int a_row = blockIdx.x + (row_block * gridDim.x);

        for (int b_row = 0; b_row < B_TRANS_ROWS; b_row++) {
            int total = 0;

            for (int thread_i = 0; thread_i * blockDim.x < A_COLS; thread_i++) {
                int thread_col = threadIdx.x + (thread_i * blockDim.x);

                // Optimize: Use ternary operator for condition
                smem[threadIdx.x] = (thread_col < A_COLS) ? mat_a[a_row * A_COLS + thread_col] * mat_b[b_row * B_TRANS_COLS + thread_col] : 0;
                __syncthreads();

                // Optimization: Unroll the parallel reduction loop
                for (int i = blockDim.x / 2; i > 0; i /= 2) {
                    if (threadIdx.x < i) {
                        smem[threadIdx.x] += smem[threadIdx.x + i];
                    }
                    __syncthreads();
                }

                if (threadIdx.x == 0) {
                    total += smem[0];
                }
            }
            
            if (threadIdx.x == 0) {
                res[a_row * C_COLS + b_row] = total;
            }
        }
    }
}