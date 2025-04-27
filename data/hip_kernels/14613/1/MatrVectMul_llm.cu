#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrVectMul(int *d_c, int *d_a, int *d_b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < N)
    {
        int sum = 0; // Use a local variable for accumulation to reduce memory access
        for (int k = 0; k < N; k++)
        {
            sum += d_a[i + k * N] * d_b[k];
        }
        d_c[i] = sum;
    }
}