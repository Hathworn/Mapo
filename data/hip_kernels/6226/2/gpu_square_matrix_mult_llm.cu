#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_square_matrix_mult(int *d_a, int *d_b, int *d_result, int n) 
{
    __shared__ int tile_a[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ int tile_b[BLOCK_SIZE][BLOCK_SIZE];

    int row = blockIdx.y * BLOCK_SIZE + threadIdx.y;
    int col = blockIdx.x * BLOCK_SIZE + threadIdx.x;
    int tmp = 0;
    int idx;

    for (int sub = 0; sub < gridDim.x; ++sub) 
    {
        // Reduce repeated calculations
        int aIdx = row * n + sub * BLOCK_SIZE + threadIdx.x;
        int bIdx = (sub * BLOCK_SIZE + threadIdx.y) * n + col;

        tile_a[threadIdx.y][threadIdx.x] = (aIdx < n * n) ? d_a[aIdx] : 0;
        tile_b[threadIdx.y][threadIdx.x] = (bIdx < n * n) ? d_b[bIdx] : 0;
        
        __syncthreads();

        #pragma unroll  // Suggest unrolling for better performance
        for (int k = 0; k < BLOCK_SIZE; ++k) 
        {
            tmp += tile_a[threadIdx.y][k] * tile_b[k][threadIdx.x];
        }

        __syncthreads();
    }
    // Store the result only if within bounds
    if (row < n && col < n) 
    {
        d_result[row * n + col] = tmp;
    }
}