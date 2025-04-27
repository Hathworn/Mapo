#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_DIM 16

__global__ void sgemm_kernel_v2(const float *A, const float *B, float *C, int M, int N, int K, float alpha, float beta)
{
    // Get global indices
    int global_x = blockIdx.x * blockDim.x + threadIdx.x;
    int global_y = blockIdx.y * blockDim.y + threadIdx.y;

    // Initialize local cache for the result
    float element_c = 0.f;

    // Declare shared memory for sub-matrices
    __shared__ float s_tile_A[BLOCK_DIM][BLOCK_DIM];
    __shared__ float s_tile_B[BLOCK_DIM][BLOCK_DIM];

    // Iterate over tiles
    for (int k = 0; k < K; k += BLOCK_DIM)
    {
        // Load tiles into shared memory, ensuring boundaries are not exceeded
        s_tile_A[threadIdx.y][threadIdx.x] = (global_y < M && (k + threadIdx.x) < K) ? A[global_y * K + k + threadIdx.x] : 0.0f;
        s_tile_B[threadIdx.y][threadIdx.x] = ((k + threadIdx.y) < K && global_x < N) ? B[(k + threadIdx.y) * N + global_x] : 0.0f;

        __syncthreads();

        // Compute partial product for each tile
        for (int e = 0; e < BLOCK_DIM; e++)
            element_c += s_tile_A[threadIdx.y][e] * s_tile_B[e][threadIdx.x];

        __syncthreads();
    }

    // Write the final result to global memory, ensuring within matrix boundaries
    if (global_y < M && global_x < N) {
        C[global_y * N + global_x] = alpha * element_c + beta * C[global_y * N + global_x];
    }
}