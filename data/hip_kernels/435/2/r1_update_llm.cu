#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS_PER_BLOCK 512

__global__ void r1_update(double *A, int m, int n, int lda, double *col, int ldc, double *row) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;

    // Optimize loop to minimize redundant computation
    if (idx < m && idy < n - 1) {
        double col_val = col[idy * ldc]; // Load once per idy
        for (int ii = 0; ii < n - 1; ii++) {
            A[idx * lda + ii + 1] -= col_val * row[ii + 1];
        }
    }
}