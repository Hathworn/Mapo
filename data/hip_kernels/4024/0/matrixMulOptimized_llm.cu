#include "hip/hip_runtime.h"
#include "includes.h"
#define size 1024
#define block_size 32

__global__ void matrixMulOptimized(int* a, int* b, int* c)
{
    __shared__ float a_share[block_size][block_size];
    __shared__ float b_share[block_size][block_size];

    int n = size;
    int row = blockDim.y * blockIdx.y + threadIdx.y;
    int col = blockDim.x * blockIdx.x + threadIdx.x;
    int local_c = 0;

    // Iterate through tiles
    for (int i = 0; i < n / block_size; ++i)
    {
        // Load from global memory to shared memory
        a_share[threadIdx.y][threadIdx.x] = a[row * n + i * block_size + threadIdx.x];
        b_share[threadIdx.y][threadIdx.x] = b[(i * block_size + threadIdx.y) * n + col];

        __syncthreads();

        // Compute partial product for this tile
        #pragma unroll
        for (int k = 0; k < block_size; ++k)
        {
            local_c += a_share[threadIdx.y][k] * b_share[k][threadIdx.x];
        }

        __syncthreads();
    }

    // Write back the result to global memory
    c[row * n + col] = local_c;
}