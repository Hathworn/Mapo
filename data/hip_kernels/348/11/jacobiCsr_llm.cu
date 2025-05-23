#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void jacobiCsr(float *x, const float *diagonal_values, const float *values, const int *rowPtr, const int *colIdx, const float *y, const int size)
{
    const int index = blockIdx.x * blockDim.x + threadIdx.x;

    if (index < size)
    {
        int row_start = rowPtr[index];
        int row_end = rowPtr[index + 1];

        #pragma unroll  // Unroll loops for better performance
        for (int j = 0; j < 30; j++)
        {
            float sum = 0;  // Initialize sum inside the inner loop

            for (int i = row_start; i < row_end; i++)
            {
                sum += values[i] * x[colIdx[i]];
            }

            x[index] = (y[index] - sum) / diagonal_values[index];

            __syncthreads();  // Synchronize threads after each iteration
        }
    }
}