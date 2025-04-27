#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemm_kernel_B(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    // Shared memory for tiles
    __shared__ float As[16][16];
    __shared__ float Bs[16][16];

    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    float sum = 0.f;
    
    // Loop over tiles
    for (int t = 0; t < (K + 15) / 16; t++) {
        // Load tiles into shared memory
        if(t * 16 + threadIdx.x < K && row < N)
            As[threadIdx.y][threadIdx.x] = A[row * K + t * 16 + threadIdx.x];
        else
            As[threadIdx.y][threadIdx.x] = 0.0f;

        if(t * 16 + threadIdx.y < K && col < M)
            Bs[threadIdx.y][threadIdx.x] = B[(t * 16 + threadIdx.y) * M + col];
        else
            Bs[threadIdx.y][threadIdx.x] = 0.0f;

        __syncthreads();  // Wait for all threads to load the tiles

        // Multiply and accumulate
        for (int i = 0; i < 16; ++i)
            sum += As[threadIdx.y][i] * Bs[i][threadIdx.x];

        __syncthreads();  // Ensure all threads complete calculations
    }

    if(row < N && col < M)
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
}