#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemm_gpu_kernel(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    // Using shared memory for tiles
    __shared__ float tileA[32][32];
    __shared__ float tileB[32][32];

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int col = blockIdx.x * blockDim.x + tx;
    int row = blockIdx.y * blockDim.y + ty;

    float sum = 0.0f;

    for (int t = 0; t < (K + 31) / 32; ++t)
    {
        // Load tiles into shared memory
        if (row < N && t * 32 + tx < K)
            tileA[ty][tx] = A[row * K + t * 32 + tx];
        else
            tileA[ty][tx] = 0.0f;

        if (col < M && t * 32 + ty < K)
            tileB[ty][tx] = B[(t * 32 + ty) * M + col];
        else
            tileB[ty][tx] = 0.0f;

        __syncthreads();

        // Compute partial product for this tile
        for (int i = 0; i < 32; ++i)
        {
            sum += tileA[ty][i] * tileB[i][tx];
        }

        __syncthreads();
    }

    if (row < N && col < M)
    {
        // Write result back to global memory
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
    }
}