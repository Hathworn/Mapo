#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemm_kernel(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    // Use shared memory for tiles of A and B
    __shared__ float Asub[32][32];
    __shared__ float Bsub[32][32];

    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    float sum = 0.f;

    // Loop over A and B tiles
    for (int tile = 0; tile < (K-1)/32+1; ++tile) {
        if (tile * 32 + threadIdx.x < K && row < N)
            Asub[threadIdx.y][threadIdx.x] = A[row * K + tile * 32 + threadIdx.x];
        else
            Asub[threadIdx.y][threadIdx.x] = 0.f;

        if (tile * 32 + threadIdx.y < K && col < M)
            Bsub[threadIdx.y][threadIdx.x] = B[(tile * 32 + threadIdx.y) * M + col];
        else
            Bsub[threadIdx.y][threadIdx.x] = 0.f;

        __syncthreads();

        // Multiply the tiles
        for (int i = 0; i < 32; ++i)
            sum += Asub[threadIdx.y][i] * Bsub[i][threadIdx.x];

        __syncthreads();
    }

    if(row < N && col < M)
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
}