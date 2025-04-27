#include "hip/hip_runtime.h"
#include "includes.h"
#define TILE_DIM 16

__global__ void sgemm_kernel(const float *A, const float *B, float *C, int M, int N, int K, float alpha, float beta) {
    extern __shared__ float shared_mem[];
    float *A_shared = shared_mem;
    float *B_shared = shared_mem + TILE_DIM * TILE_DIM;

    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    float element_c = 0.f;

    // Loop over tiles
    for (int tileIdx = 0; tileIdx < (K - 1) / TILE_DIM + 1; ++tileIdx) {
        if (row < M && tileIdx * TILE_DIM + threadIdx.x < K)
            A_shared[threadIdx.y * TILE_DIM + threadIdx.x] = A[row * K + tileIdx * TILE_DIM + threadIdx.x];
        else
            A_shared[threadIdx.y * TILE_DIM + threadIdx.x] = 0.0f;

        if (tileIdx * TILE_DIM + threadIdx.y < K && col < N)
            B_shared[threadIdx.y * TILE_DIM + threadIdx.x] = B[(tileIdx * TILE_DIM + threadIdx.y) * N + col];
        else
            B_shared[threadIdx.y * TILE_DIM + threadIdx.x] = 0.0f;

        __syncthreads();

        // Accumulate results within the shared memory
        for (int e = 0; e < TILE_DIM; e++) {
            element_c += A_shared[threadIdx.y * TILE_DIM + e] * B_shared[e * TILE_DIM + threadIdx.x];
        }
        __syncthreads();
    }

    if (row < M && col < N)
        C[row * N + col] = alpha * element_c + beta * C[row * N + col];
}