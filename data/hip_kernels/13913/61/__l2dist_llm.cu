#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __l2dist(double *A, int lda, double *B, int ldb, double *C, int ldc, int d, int nrows, int ncols, double p) {
    // Calculate thread indexes
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure within bounds
    if (row < nrows && col < ncols) {
        double dist = 0.0;
        // Compute the Euclidean distance
        for (int i = 0; i < d; ++i) {
            double diff = A[row * lda + i] - B[i * ldb + col];
            dist += diff * diff;
        }
        C[row * ldc + col] = sqrt(dist);
    }
}