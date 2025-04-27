#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matMul(float *a, float *b, float *c, int M, int N, int K)
{
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;

    if(row >= M || col >= N)
        return;

    float sum = 0.f;

    // Optimize loop for better memory access patterns
    for(int k = 0; k < K; k++)
    {
        sum += a[row * K + k] * b[k * N + col];
    }

    c[row * N + col] = sum;
}