#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMult(int* m, int* n, int* p, int size)
{
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize partial sum to zero
    int p_sum = 0;

    if(row < size && col < size) { // Check bounds to avoid invalid memory access
        for (int i = 0; i < size; i++) {
            // Accumulate product for current row and column
            p_sum += m[row * size + i] * n[i * size + col];
        }
        // Write result to output matrix
        p[row * size + col] = p_sum;
    }
}