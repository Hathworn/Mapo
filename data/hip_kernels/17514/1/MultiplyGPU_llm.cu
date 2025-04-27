#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 16

__global__ void MultiplyGPU(float* a, float* b, float* c, int t)
{
    // Calculate row and column indices
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    float aux = 0.0f;

    // Ensure indices are within bounds
    if (i < t && j < t)
    {
        // Use shared memory for improved cache efficiency
        __shared__ float a_shared[BLOCK_SIZE][BLOCK_SIZE];
        __shared__ float b_shared[BLOCK_SIZE][BLOCK_SIZE];

        for (int k = 0; k < t; k += BLOCK_SIZE)
        {
            // Load data into shared memory
            if (k + threadIdx.x < t && i < t)
                a_shared[threadIdx.y][threadIdx.x] = a[i * t + (k + threadIdx.x)];
            else
                a_shared[threadIdx.y][threadIdx.x] = 0.0f;

            if (k + threadIdx.y < t && j < t)
                b_shared[threadIdx.y][threadIdx.x] = b[(k + threadIdx.y) * t + j];
            else
                b_shared[threadIdx.y][threadIdx.x] = 0.0f;

            __syncthreads();

            // Perform partial multiplication
            for (int n = 0; n < BLOCK_SIZE; n++)
            {
                aux += a_shared[threadIdx.y][n] * b_shared[n][threadIdx.x];
            }

            __syncthreads();
        }

        // Write result to matrix c
        c[i * t + j] = aux;
    }
}