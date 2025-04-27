#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void __linfdist(double *A, int lda, double *B, int ldb, double *C, int ldc, int d, int nrows, int ncols, double p) {
    // Calculate global thread indices
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if thread is within matrix bounds
    if (row < nrows && col < ncols) {
        double maxDist = 0.0;
        for (int i = 0; i < d; i++) {
            // Calculate max-abs distance
            double diff = fabs(A[row * lda + i] - B[col * ldb + i]);
            if (diff > maxDist) {
                maxDist = diff;
            }
        }
        // Store the result in matrix C
        C[row * ldc + col] = maxDist;
    }
}