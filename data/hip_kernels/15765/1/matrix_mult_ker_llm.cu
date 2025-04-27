#include "hip/hip_runtime.h"
#include "includes.h"
__device__ float rowcol_dot(float *matrix_a, float *matrix_b, int row, int col, int N)
{
    float val = 0;
    for (int k = 0; k < N; k++)
    {
        val += matrix_a[row * N + k] * matrix_b[col + k * N];
    }
    return val;
}

__global__ void matrix_mult_ker(float *matrix_a, float *matrix_b, float *output_matrix, int N)
{
    // Compute row and column indices within the grid.
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if within bounds before computation.
    if (row < N && col < N)
    {
        output_matrix[col + row * N] = rowcol_dot(matrix_a, matrix_b, row, col, N);
    }
}