#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __l1dist(float *A, int lda, float *B, int ldb, float *C, int ldc, int d, int nrows, int ncols, float p) {
    // Calculate unique indices for this thread
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread indexes are within matrix dimensions
    if (row < nrows && col < ncols) {
        float sum = 0.0f;
        
        // Calculate the L1 distance for the current row and column
        for (int k = 0; k < d; ++k) {
            float diff = A[row * lda + k] - B[k * ldb + col];
            sum += fabs(diff);
        }
        
        // Store the result in the output matrix C
        C[row * ldc + col] = sum;
    }
}