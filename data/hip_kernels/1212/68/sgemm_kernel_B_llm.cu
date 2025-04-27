#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemm_kernel_B(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    // Use shared memory to optimize memory access
    __shared__ float Asub[32][32];
    __shared__ float Bsub[32][32];
    
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int bx = blockIdx.x;
    int by = blockIdx.y;
    int row = by * blockDim.y + ty;
    int col = bx * blockDim.x + tx;

    float sum = 0.f;

    for (int t = 0; t < (K + 31) / 32; ++t) {
        if (row < N && t * 32 + tx < K)
            Asub[ty][tx] = A[row * K + t * 32 + tx];
        else
            Asub[ty][tx] = 0.0f;
        
        if (col < M && t * 32 + ty < K)
            Bsub[ty][tx] = B[(t * 32 + ty) * M + col];
        else
            Bsub[ty][tx] = 0.0f;

        __syncthreads();

        for (int i = 0; i < 32; ++i) {
            sum += Asub[ty][i] * Bsub[i][tx];
        }
        
        __syncthreads();
    }

    if (row < N && col < M)
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
}