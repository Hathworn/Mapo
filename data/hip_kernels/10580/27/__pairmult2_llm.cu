#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __pairmult2(int nrows, int bncols, int brows1, int brows2, float *A, int lda, float *A2, int lda2, float *Bdata, int *Bir, int *Bjc, int broff, int bcoff, float *C, int ldc, int transpose) {
    // Calculate the global row and column index
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Boundary Check
    if (row < nrows && col < bncols) {
        // Initialize the result accumulation variable
        float sum = 0.0f;
        
        // Main computation loop
        for (int idx = Bjc[col + bcoff]; idx < Bjc[col + bcoff + 1]; ++idx) {
            int b_row = Bir[idx];
            if (b_row >= broff) {
                b_row -= broff;
                if (b_row < brows1 || (b_row >= brows1 + brows2 && b_row < nrows)) {
                    if (transpose) {
                        sum += A[b_row * lda + row] * Bdata[idx];
                    } else {
                        sum += A[row * lda + b_row] * Bdata[idx];
                    }
                }
            }
        }
        
        // Write the result
        C[row * ldc + col] = sum;
    }
}