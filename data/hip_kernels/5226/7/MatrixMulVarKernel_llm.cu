#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulVarKernel(float* M, float* N, float* P, int widthAHeightB, int heightA, int widthB) {
    int Row = blockIdx.y * blockDim.y + threadIdx.y;  // Calculate the row index of the P element and M
    int Col = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate the column index of P and N
    if (Row < heightA && Col < widthB) {
        float Pvalue = 0;
        // Loop unrolling for better performance by processing two elements per iteration
        for (int k = 0; k < widthAHeightB - 1; k += 2) {
            Pvalue += M[Row * widthAHeightB + k] * N[k * widthB + Col];
            Pvalue += M[Row * widthAHeightB + k + 1] * N[(k + 1) * widthB + Col];
        }
        // Process any remaining element outside the loop if widthAHeightB is odd
        if (widthAHeightB % 2 != 0) {
            Pvalue += M[Row * widthAHeightB + (widthAHeightB - 1)] * N[(widthAHeightB - 1) * widthB + Col];
        }
        P[Row * widthB + Col] = Pvalue;
    }
}