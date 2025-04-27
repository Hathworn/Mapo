#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __dds0(int nrows, int ncols, double *A, double *B, int *Cir, int *Cjc, double *P) {
    int row = blockIdx.x * blockDim.x + threadIdx.x; // Calculate row based on thread and block index
    if (row < nrows) { // Ensure row index is within bounds
        double sum = 0.0;
        int row_start = Cjc[row];
        int row_end = Cjc[row+1];
        for (int j = row_start; j < row_end; j++) {
            int col = Cir[j];
            sum += A[col] * B[j];
        }
        P[row] = sum;
    }
}