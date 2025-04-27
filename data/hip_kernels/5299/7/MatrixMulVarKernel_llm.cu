#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulVarKernel(float* M, float* N, float* P, int widthAHeightB, int heightA, int widthB) {
    int Row = blockIdx.y * blockDim.y + threadIdx.y; // Calculate row index
    int Col = blockIdx.x * blockDim.x + threadIdx.x; // Calculate column index
    if ((Row < heightA) && (Col < widthB)) {
        float Pvalue = 0.0f;
        int indexM = Row * widthAHeightB; // Pre-compute row start index for M
        int indexN = Col; // Column start index for N
        for (int k = 0; k < widthAHeightB; ++k) {
            Pvalue += M[indexM + k] * N[k * widthB + indexN]; // Accumulate product
        }
        P[Row * widthB + Col] = Pvalue; // Store result
    }
}