#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sgemm_kernel(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    // Calculate the column index
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate the row index
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    if (row < N && col < M) // Ensure within bounds
    {
        // Use shared memory for block of B
        __shared__ float shared_B[BLOCK_SIZE][BLOCK_SIZE];
        float sum = 0.f;

        for (int tile = 0; tile < (K + BLOCK_SIZE - 1) / BLOCK_SIZE; ++tile) 
        {
            // Load A and B blocks into registers and shared memory
            float a_element = 0.f;
            if (tile * BLOCK_SIZE + threadIdx.x < K) 
            {
                a_element = A[row * K + tile * BLOCK_SIZE + threadIdx.x];
            }
            if (tile * BLOCK_SIZE + threadIdx.y < K && col < M) 
            {
                shared_B[threadIdx.y][threadIdx.x] = B[(tile * BLOCK_SIZE + threadIdx.y) * M + col];
            }
            else
            {
                shared_B[threadIdx.y][threadIdx.x] = 0.f;
            }
            __syncthreads(); // Ensure all elements are loaded before computation

            // Matrix multiplication using sub-matrices
            for (int i = 0; i < BLOCK_SIZE; ++i) 
            {
                sum += a_element * shared_B[i][threadIdx.x];
            }
            __syncthreads(); // Ensure computation is finished before loading next tiles
        }

        C[row * M + col] = alpha * sum + beta * C[row * M + col]; // Compute final sum
    }
}