#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void chol_kernel_optimized_div_old(float * U, int k, int stride) {
    // General thread id
    int tx = blockIdx.x * blockDim.x + threadIdx.x;

    // Iterators
    unsigned int j;
    unsigned int num_rows = MATRIX_SIZE;

    // Only let one thread do this
    if (tx == 0) {
        // Take the square root of the diagonal element
        U[k * num_rows + k] = sqrtf(U[k * num_rows + k]); // Use sqrtf for better performance

        // Unroll loop for Division step
        #pragma unroll
        for (j = (k + 1); j < num_rows; j++) {
            U[k * num_rows + j] /= U[k * num_rows + k]; // Division step
        }
    }
}