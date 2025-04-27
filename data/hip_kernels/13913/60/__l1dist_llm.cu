#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __l1dist(double *A, int lda, double *B, int ldb, double *C, int ldc, int d, int nrows, int ncols, double p) {
    // Calculate global row and column index
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure row and column are within matrix bounds
    if (row < nrows && col < ncols) {
        double sum = 0.0;

        // Compute L1 distance for the current element
        for (int k = 0; k < d; ++k) {
            sum += fabs(A[row * lda + k] - B[k * ldb + col]);
        }

        // Store the computed distance into the matrix C
        C[row * ldc + col] = sum;
    }
}