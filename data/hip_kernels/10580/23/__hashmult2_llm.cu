#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __hashmult2(int nrows, int nfeats, int ncols, int brows1, int brows2, float *A, float *Bdata, int *Bir, int *Bjc, float *C, int transpose) {
    // Calculate row and column using thread and block indices for improved parallelization
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if row and column are within bounds
    if (row < nrows && col < ncols) {
        float sum = 0.0f;
        for (int idx = Bjc[col]; idx < Bjc[col + 1]; ++idx) {
            int bRow = Bir[idx];
            sum += A[row * nfeats + bRow] * Bdata[idx];
        }
        C[row * ncols + col] = sum;
    }
}