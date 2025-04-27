#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sgemm_kernel_v2(const float *A, const float *B, float *C, int M, int N, int K, float alpha, float beta)
{
    int bid_x = blockIdx.x * blockDim.x;
    int bid_y = blockIdx.y * blockDim.y;
    int tid_x = threadIdx.x;
    int tid_y = threadIdx.y;

    float element_c = 0.f;
    __shared__ float s_tile_A[BLOCK_DIM][BLOCK_DIM];
    __shared__ float s_tile_B[BLOCK_DIM][BLOCK_DIM];

    // Process tiles
    for (int k = 0; k < K; k += BLOCK_DIM)
    {
        // Load A and B matrices into shared memory efficiently
        s_tile_A[tid_y][tid_x] = (bid_y + tid_y) < M && (tid_x + k) < K ? A[(bid_y + tid_y) * K + tid_x + k] : 0;
        s_tile_B[tid_y][tid_x] = (tid_y + k) < K && (bid_x + tid_x) < N ? B[(k + tid_y) * N + bid_x + tid_x] : 0;

        __syncthreads();

        // Cache-friendly multiplication
        for (int e = 0; e < BLOCK_DIM; e++)
            element_c += s_tile_A[tid_y][e] * s_tile_B[e][tid_x];

        __syncthreads();
    }

    // Validate indices before writing result
    if ((bid_y + tid_y) < M && (bid_x + tid_x) < N)
    {
        C[(bid_y + tid_y) * N + (bid_x + tid_x)] = alpha * element_c + beta * C[(bid_y + tid_y) * N + (bid_x + tid_x)];
    }
}