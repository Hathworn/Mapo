#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __l2dist(float *A, int lda, float *B, int ldb, float *C, int ldc, int d, int nrows, int ncols, float p) {
    int row = blockIdx.x * blockDim.x + threadIdx.x; // Calculate row index
    int col = blockIdx.y * blockDim.y + threadIdx.y; // Calculate column index

    if (row < nrows && col < ncols) {
        float dist = 0.0f; // Initialize distance
        for (int k = 0; k < d; ++k) {
            float diff = A[row * lda + k] - B[k * ldb + col]; // Element-wise subtraction
            dist += diff * diff; // Accumulate squared differences
        }
        C[row * ldc + col] = powf(dist, 1.0f / p); // Assign computed distance
    }
}