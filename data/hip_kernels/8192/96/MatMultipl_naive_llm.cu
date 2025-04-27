#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MatMultipl_optimized(float * A, float * B, float * C, int nColsA, int nColsB, int sizeC) {
    int i_col = blockIdx.x * blockDim.x + threadIdx.x; // index in row
    int i_row = blockIdx.y * blockDim.y + threadIdx.y; // index in column
    int idx = i_row * nColsB + i_col; // # of cols in B = # of cols in C

    if (i_row < sizeC / nColsB && i_col < nColsB) { // Boundary check optimization
        float Cvalue = 0;
        for (int e = 0; e < nColsA; e++) {
            Cvalue += A[i_row * nColsA + e] * B[e * nColsB + i_col];
        }
        C[idx] = Cvalue;
    }
}