#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulKernelV1(float* M, float* N, float* P, int Width)
{
    // Calculate row and column based on thread/block position
    int Row = blockIdx.y * blockDim.y + threadIdx.y;
    int Col = blockIdx.x * blockDim.x + threadIdx.x;

    if (Row < Width && Col < Width) {
        float Pvalue = 0.0f;  // Initialize partial result

        // Loop unrolling for performance improvement
        for (int k = 0; k < Width; k += 4) {
            Pvalue += M[Row * Width + k] * N[k * Width + Col];
            if (k + 1 < Width) Pvalue += M[Row * Width + k + 1] * N[(k + 1) * Width + Col];
            if (k + 2 < Width) Pvalue += M[Row * Width + k + 2] * N[(k + 2) * Width + Col];
            if (k + 3 < Width) Pvalue += M[Row * Width + k + 3] * N[(k + 3) * Width + Col];
        }

        // Write result to memory
        P[Row * Width + Col] = Pvalue;
    }
}