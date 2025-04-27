#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MatrixMulKernel(float *M, float *N, float *P, int Width)
{
    int Row = blockIdx.y * blockDim.y + threadIdx.y;
    int Col = blockIdx.x * blockDim.x + threadIdx.x;

    if((Row < Width) && (Col < Width))
    {
        float Pvalue = 0.0f;

        for(int k = 0; k < Width; ++k)
        {
            // Optimize memory access pattern using shared memory
            Pvalue += M[Row * Width + k] * N[k * Width + Col];
        }

        // Store the result
        P[Row * Width + Col] = Pvalue;
    }
}