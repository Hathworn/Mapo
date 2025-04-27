#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mat_mult_transposed_kernel(int *mat_a, int *mat_b, int *res) {
    int B_TRANS_ROWS = B_COLS;
    int B_TRANS_COLS = B_ROWS;
    __shared__ int smem[128];

    int a_row_stride = gridDim.x;  // Stride for outer loop over rows of A
    int a_row_start = blockIdx.x;  // Starting row index for current block

    for (int a_row = a_row_start; a_row < A_ROWS; a_row += a_row_stride) {
        for (int b_row = 0; b_row < B_TRANS_ROWS; b_row++) {

            int total = 0;
            int thread_stride = blockDim.x;  // Stride for inner loop over columns
            int thread_start = threadIdx.x;  // Starting column index for current thread

            for (int thread_col = thread_start; thread_col < A_COLS; thread_col += thread_stride) {
                if (thread_col < A_COLS) {
                    smem[threadIdx.x] = mat_a[a_row * A_COLS + thread_col] * mat_b[b_row * B_TRANS_COLS + thread_col];
                } else {
                    smem[threadIdx.x] = 0;
                }
                __syncthreads();

                // Parallel reduction
                for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
                    if (threadIdx.x < stride) {
                        smem[threadIdx.x] += smem[threadIdx.x + stride];
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