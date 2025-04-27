#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized Global Kernel for Matrix-Matrix Multiplication
__global__ void matrix_matrix_new(int *a, int *b, int *c, int n_row, int n_col, int n_comm)
{
    // Calculate unique thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for common data to reduce global memory access
    __shared__ int shared_a[128];  // Assuming 128 threads per block, adjust as needed
    __shared__ int shared_b[128];

    while (tid < n_row * n_col)
    {
        // Determine row and column for current thread
        int i = tid / n_col;
        int j = tid % n_col;

        int temp = 0;
        // Iterate over the common dimension with tile optimization
        for (int k = 0; k < n_comm; k += blockDim.x)
        {
            // Load portions of a and b into shared memory
            if (k + threadIdx.x < n_comm) {
                shared_a[threadIdx.x] = a[i * n_comm + k + threadIdx.x];
                shared_b[threadIdx.x] = b[(k + threadIdx.x) * n_col + j];
            }
            __syncthreads();

            // Perform partial computation using shared memory
            for (int x = 0; x < blockDim.x; ++x)
            {
                temp += shared_a[x] * shared_b[x];
            }
            __syncthreads();
        }
        c[tid] = temp;
        tid += blockDim.x * gridDim.x;  // Process next element within the grid stride
    }
}