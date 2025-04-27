#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMul(float *Md, float *Nd, float *Pd, const int WIDTH)
{
    // Calculate global thread row and column indices
    unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int row = blockIdx.y * blockDim.y + threadIdx.y;

    if (row < WIDTH && col < WIDTH) // Ensure indices are within bounds
    {
        float Pvalue = 0; // Initialize accumulator
        for (int k = 0; k < WIDTH; ++k)
        {
            // Accumulate results of matrix multiplication
            Pvalue += Md[row * WIDTH + k] * Nd[k * WIDTH + col];
        }
        Pd[row * WIDTH + col] = Pvalue; // Store result
    }
}