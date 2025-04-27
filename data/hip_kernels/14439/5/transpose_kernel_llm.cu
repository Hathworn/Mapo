#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define IDX2C(i, j, ld) ((j)*(ld)+(i))
#define SQR(x)      ((x)*(x))                        // x^2

__global__ void transpose_kernel(double const* matrices, double* transposed) {
    // Improve memory access by reordering the thread indices 
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = threadIdx.y;
    int matrix_index = IDX2C(row, col, blockDim.y);
    int transpose_index = IDX2C(col, row, blockDim.x);
    transposed[transpose_index] = matrices[matrix_index];
}