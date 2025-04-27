#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatMultipl_optimized(float *A, float *B, float *C, int nColsA, int nColsB, int sizeC) {
    int i_col = blockIdx.x * blockDim.x + threadIdx.x; // Compute column index
    int i_row = blockIdx.y * blockDim.y + threadIdx.y; // Compute row index

    if (i_col < nColsB && i_row < sizeC / nColsB) { // Bounds check
        float Cvalue = 0.0f;
        for (int e = 0; e < nColsA; e++) {
            Cvalue += A[i_row * nColsA + e] * B[e * nColsB + i_col];
        }
        C[i_row * nColsB + i_col] = Cvalue; // Update C
    }
}