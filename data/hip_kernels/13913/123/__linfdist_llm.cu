#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void __linfdist(float *A, int lda, float *B, int ldb, float *C, int ldc, int d, int nrows, int ncols, float p) {
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;
    if (row < nrows && col < ncols) {  // Ensuring indices are within bounds
        float max_abs_diff = 0.0f;
        for (int i = 0; i < d; ++i) {
            float abs_diff = fabsf(A[row * lda + i] - B[i * ldb + col]);
            if (abs_diff > max_abs_diff) {
                max_abs_diff = abs_diff;  // Track maximum absolute difference
            }
        }
        C[row * ldc + col] = max_abs_diff;  // Update result matrix
    }
}