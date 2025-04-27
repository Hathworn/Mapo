#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void chol_kernel(float * U, int ops_per_thread) {
    int tx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int num_rows = MATRIX_SIZE;

    for (unsigned int k = 0; k < num_rows; k++) {
        if (tx == 0) {
            // Compute square root and division on the diagonal
            U[k * num_rows + k] = sqrt(U[k * num_rows + k]);
            for (unsigned int j = k + 1; j < num_rows; j++) {
                U[k * num_rows + j] /= U[k * num_rows + k];
            }
        }
        __syncthreads();

        // Calculate this thread's range of work
        int istart = (k + 1) + tx * ops_per_thread;
        int iend = min(istart + ops_per_thread, (int)num_rows);

        for (unsigned int i = istart; i < iend; i++) {
            for (unsigned int j = i; j < num_rows; j++) {
                U[i * num_rows + j] -= U[k * num_rows + i] * U[k * num_rows + j];
            }
        }
        __syncthreads();
    }

    // Zero out the lower triangular portion of U
    int istart = tx * ops_per_thread;
    int iend = min(istart + ops_per_thread, (int)num_rows);

    for (unsigned int i = istart; i < iend; i++) {
        for (unsigned int j = 0; j < i; j++) {
            U[i * num_rows + j] = 0.0f;
        }
    }
}