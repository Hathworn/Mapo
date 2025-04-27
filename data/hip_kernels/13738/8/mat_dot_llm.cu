#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mat_dot(float *a, float *b, float *c, int a_rows, int a_columns, int b_rows, int b_columns)
{
    const int i = blockDim.y * blockIdx.y + threadIdx.y;
    const int j = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < a_rows && j < b_columns)
    {
        float c_at_ij = 0;
        // Use shared memory to reduce global memory accesses
        __shared__ float sharedA[BLOCK_SIZE][BLOCK_SIZE];
        __shared__ float sharedB[BLOCK_SIZE][BLOCK_SIZE];

        for (int tile = 0; tile < (a_columns + BLOCK_SIZE - 1) / BLOCK_SIZE; ++tile) 
        {
            if (tile * BLOCK_SIZE + threadIdx.x < a_columns && i < a_rows)
                sharedA[threadIdx.y][threadIdx.x] = a[i * a_columns + tile * BLOCK_SIZE + threadIdx.x];
            else
                sharedA[threadIdx.y][threadIdx.x] = 0.0f;

            if (tile * BLOCK_SIZE + threadIdx.y < b_rows && j < b_columns) 
                sharedB[threadIdx.y][threadIdx.x] = b[(tile * BLOCK_SIZE + threadIdx.y) * b_columns + j];
            else
                sharedB[threadIdx.y][threadIdx.x] = 0.0f;

            __syncthreads();

            for (int k = 0; k < BLOCK_SIZE; ++k)
                c_at_ij += sharedA[threadIdx.y][k] * sharedB[k][threadIdx.x];

            __syncthreads();
        }

        c[i * b_columns + j] = c_at_ij;
    }
}