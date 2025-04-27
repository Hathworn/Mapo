#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __minkowskidist(float *A, int lda, float *B, int ldb, float *C, int ldc, int d, int nrows, int ncols, float p) {
    // Calculate thread indices for matrix rows and columns
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check boundaries
    if (row < nrows && col < ncols) {
        float sum = 0.0f;
        // Compute the Minkowski distance for each dimension
        for (int i = 0; i < d; i++) {
            float diff = A[row * lda + i] - B[i * ldb + col];
            sum += pow(fabs(diff), p);
        }
        // Compute p-th root of sum for the Minkowski distance
        C[row * ldc + col] = pow(sum, 1.0f / p);
    }
}