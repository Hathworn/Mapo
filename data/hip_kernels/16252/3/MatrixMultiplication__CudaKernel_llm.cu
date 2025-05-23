#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMultiplication__CudaKernel(int* in_tabA, int* in_tabB, int* out_tabC, int outTabWidth)
{
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure only valid threads perform calculations
    if (row < outTabWidth && col < outTabWidth)
    {
        int tmp_sum = 0;

        // Use loop unrolling to improve performance
        #pragma unroll
        for (int i = 0; i < outTabWidth; i++)
        {
            tmp_sum += in_tabA[row * outTabWidth + i] * in_tabB[i * outTabWidth + col];
        }
        out_tabC[row * outTabWidth + col] = tmp_sum;
    }
}