#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_matrix_mult(int *a, int *b, int *c, int m, int n, int k)
{
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Initialize sum to accumulate results
    int sum = 0;
    
    // Ensure within matrix bounds
    if (col < k && row < m)
    {
        // Loop unrolling for efficient computation
        for (int i = 0; i < n; i += 4)
        {
            sum += a[row * n + i] * b[i * k + col];
            if (i + 1 < n)
                sum += a[row * n + i + 1] * b[(i + 1) * k + col];
            if (i + 2 < n)
                sum += a[row * n + i + 2] * b[(i + 2) * k + col];
            if (i + 3 < n)
                sum += a[row * n + i + 3] * b[(i + 3) * k + col];
        }
        
        // Store result in the result matrix
        c[row * k + col] = sum;
    }
}