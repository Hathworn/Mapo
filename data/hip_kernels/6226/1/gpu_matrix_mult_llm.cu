#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_matrix_mult(int *a, int *b, int *c, int m, int n, int k)
{
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int sum = 0;

    // Check if the thread is within bounds
    if (col < k && row < m)
    {
        for (int i = 0; i < n; i++)
        {
            // Optimize access by using more registers efficiently
            int a_val = a[row * n + i];
            int b_val = b[i * k + col];
            sum += a_val * b_val;
        }
        c[row * k + col] = sum;
    }
}