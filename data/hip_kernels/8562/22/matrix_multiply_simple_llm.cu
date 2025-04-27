#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_multiply_optimized(float *a, float *b, float *ab, size_t width)
{
    // Calculate row and column index of the matrix element
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the calculated indices are valid
    if (row < width && col < width)
    {
        // Initialize the accumulation variable
        float pvalue = 0;

        // Iterate over elements to compute the dot product
        for (int k = 0; k < width; k++)
        {
            pvalue += a[row * width + k] * b[k * width + col];
        }

        // Store the result in the output matrix
        ab[row * width + col] = pvalue;
    }
}