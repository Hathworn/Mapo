#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_matrix_mult(int *a, int *b, int *c, int m, int n, int k)
{
    // Calculate row and column indices
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread is within bounds of matrix dimensions
    if (row < m && col < k)
    {
        int sum = 0;
        
        // Perform matrix multiplication using shared memory to improve access speed
        extern __shared__ int shared[];
        int* shared_a = &shared[0];
        int* shared_b = &shared[n * blockDim.x];

        for (int i = 0; i < n; i += blockDim.x)
        {
            // Load data into shared memory
            if (row < m && (i + threadIdx.x) < n)
                shared_a[threadIdx.y * blockDim.x + threadIdx.x] = a[row * n + i + threadIdx.x];
            else
                shared_a[threadIdx.y * blockDim.x + threadIdx.x] = 0;

            if (col < k && (i + threadIdx.y) < n)
                shared_b[threadIdx.y * blockDim.x + threadIdx.x] = b[(i + threadIdx.y) * k + col];
            else
                shared_b[threadIdx.y * blockDim.x + threadIdx.x] = 0;
            
            // Synchronize to ensure all shared memory loads are complete
            __syncthreads();
            
            // Summation in shared memory
            for (int j = 0; j < blockDim.x; ++j)
            {
                sum += shared_a[threadIdx.y * blockDim.x + j] * shared_b[j * blockDim.x + threadIdx.x];
            }
            
            // Synchronize to ensure all threads have summed
            __syncthreads();
        }

        // Write result to output matrix
        c[row * k + col] = sum;
    }
}