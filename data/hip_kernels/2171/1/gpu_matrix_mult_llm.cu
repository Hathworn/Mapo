#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_matrix_mult(float *a, float *b, float *c, int m, int n, int k)
{
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    float sum = 0.0f;  // Use float for sum

    if (col < k && row < m)
    {
        // Unroll loop for better performance
        for (int i = 0; i < n; i += 4)
        {
            sum += a[row * n + i] * b[i * k + col];
            if (i + 1 < n) sum += a[row * n + i + 1] * b[(i + 1) * k + col];
            if (i + 2 < n) sum += a[row * n + i + 2] * b[(i + 2) * k + col];
            if (i + 3 < n) sum += a[row * n + i + 3] * b[(i + 3) * k + col];
        }
        c[row * k + col] = sum;
    }
}