#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_matrix_mult(int *a, int *b, int *c, int m, int n, int k)
{
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int sum = 0;

    // Check bounds before computation
    if (col < k && row < m)
    {
        // Unroll loop for potential performance improvement
        int i = 0;
        for (; i <= n - 4; i += 4)
        {
            sum += a[row * n + i] * b[i * k + col];
            sum += a[row * n + i + 1] * b[(i + 1) * k + col];
            sum += a[row * n + i + 2] * b[(i + 2) * k + col];
            sum += a[row * n + i + 3] * b[(i + 3) * k + col];
        }
        // Handle the remaining elements
        for (; i < n; i++)
        {
            sum += a[row * n + i] * b[i * k + col];
        }
        c[row * k + col] = sum;
    }
}