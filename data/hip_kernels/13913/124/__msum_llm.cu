#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __msum(float *A, int lda, float *B, int ldb, float *C, int ldc, int d, int nrows, int ncols, float p) {

    // Calculate row and column index
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Check boundaries
    if (row < nrows && col < ncols) {
        float maxValue = -FLT_MAX;
        // Accumulate maximum value
        for (int k = 0; k < d; ++k) {
            maxValue = fmaxf(maxValue, A[row * lda + k] + B[k * ldb + col]);
        }
        // Store the result multiplied by p
        C[row * ldc + col] = p * maxValue;
    }
}