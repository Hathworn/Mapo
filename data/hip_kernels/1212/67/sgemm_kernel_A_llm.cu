#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemm_kernel_A(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    // Use shared memory for tiles of A and B to increase memory access efficiency
    __shared__ float tile_A[32][32];
    __shared__ float tile_B[32][32];

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int col = blockIdx.x * blockDim.x + tx;
    int row = blockIdx.y * blockDim.y + ty;

    float sum = 0.f;

    // Loop over the tiles of the matrices
    for (int m = 0; m < (K + 31) / 32; ++m)
    {
        // Collaborative loading of A and B tiles into shared memory
        if (row < N && m * 32 + tx < K)
            tile_A[ty][tx] = A[row * K + m * 32 + tx];
        else
            tile_A[ty][tx] = 0.0f;

        if (col < M && m * 32 + ty < K)
            tile_B[ty][tx] = B[(m * 32 + ty) * M + col];
        else
            tile_B[ty][tx] = 0.0f;

        __syncthreads();

        // Compute the tile result
        for (int e = 0; e < 32; ++e)
            sum += tile_A[ty][e] * tile_B[e][tx];

        __syncthreads();
    }

    // Write the result back to global memory
    if (row < N && col < M)
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
}