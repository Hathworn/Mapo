#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void __msum(double *A, int lda, double *B, int ldb, double *C, int ldc, int d, int nrows, int ncols, double p) {
    int row = blockIdx.y * blockDim.y + threadIdx.y; // Compute global row index
    int col = blockIdx.x * blockDim.x + threadIdx.x; // Compute global column index
    
    if (row < nrows && col < ncols) { // Check bounds
        double max_val = -INFINITY; // Initialize max sum to negative infinity
        for (int k = 0; k < d; ++k) { // Iterate over the dimension 'd'
            double val = A[row * lda + k] + B[k * ldb + col] - p; // Compute the value
            if (val > max_val) { // Check if it's greater than current max
                max_val = val; // Update max
            }
        }
        C[row * ldc + col] = max_val; // Store result in C
    }
}