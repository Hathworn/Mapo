#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mat_vec_mult_fixed_dims(int *mat, int *vec, int *res) {
    const int mat_rows = 1024;
    const int mat_cols = 512;
    // Use dynamic shared memory for more flexibility
    extern __shared__ int smem[];

    for (int block_i = 0; block_i * gridDim.x < mat_rows; block_i++) {
        int row = blockIdx.x + (block_i * gridDim.x);

        if (row < mat_rows) {
            int row_total = 0;
            for (int thread_i = 0; thread_i * blockDim.x < mat_cols; thread_i++) {
                int col = threadIdx.x + (thread_i * blockDim.x);
                if (col < mat_cols) {
                    // Load mult in shared memory
                    smem[threadIdx.x] = mat[row * mat_cols + col] * vec[col];
                } else {
                    smem[threadIdx.x] = 0;  // Handle out-of-bounds access
                }
                __syncthreads();

                // Parallel reduction with optimized memory access
                for (int i = blockDim.x / 2; i > 0; i /= 2) {
                    if (threadIdx.x < i) {
                        smem[threadIdx.x] += smem[threadIdx.x + i];
                    }
                    __syncthreads();
                }

                // Only 1 thread needs to update the row total
                if (threadIdx.x == 0)
                    row_total += smem[0];
            }

            // Store result
            if (threadIdx.x == 0)
                res[row] = row_total;
        }
    }
}