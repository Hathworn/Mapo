#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __minkowskidist(double *A, int lda, double *B, int ldb, double *C, int ldc, int d, int nrows, int ncols, double p) {
    // Calculate row index
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    // Calculate column index
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the row and column are within matrix bounds
    if (row < nrows && col < ncols) {
        double sum = 0.0;
        for (int k = 0; k < d; ++k) {
            // Calculate the distance increment
            double diff = A[row * lda + k] - B[k * ldb + col];
            // Accumulate the p-powered difference
            sum += pow(abs(diff), p);
        }
        // Store the p-root of the sum into result matrix C
        C[row * ldc + col] = pow(sum, 1.0 / p);
    }
}