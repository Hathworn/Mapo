```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matmul(double *a, double *b, double *c, int n)
{
    // Shared memory for sub-matrices
    extern __shared__ double shared_mem[];

    // Index for shared memory
    double* As = &shared_mem[0];
    double* Bs = &shared_mem[blockDim.x * blockDim.y];

    // Get global thread ID
    int Col = blockIdx.x * blockDim.x + threadIdx.x;
    int Row = blockIdx.y * blockDim.y + threadIdx.y;

    // Initialize the sum to zero
    double sum = 0.0;

    // Collaboratively load tiles into shared memory
    for (int tileIdx = 0; tileIdx < (n + blockDim.x - 1) / blockDim.x; ++tileIdx) {
        // Load elements of a into shared memory
        if (Row < n && (tileIdx * blockDim.x + threadIdx.x) < n)
            As[threadIdx.y * blockDim.x + threadIdx.x] = a[Row * n + tileIdx * blockDim.x + threadIdx.x];
        else
            As[threadIdx.y * blockDim.x + threadIdx.x] = 0.0;

        // Load elements of b into shared memory
        if (Col < n && (tileIdx * blockDim.y + threadIdx.y) < n)
            Bs[threadIdx.y * blockDim.x + threadIdx.x] = b[(tileIdx * blockDim.y + threadIdx.y) * n + Col];
        else
            Bs[threadIdx.y * blockDim.x + threadIdx.x] = 0.0;

        // Synchronize threads to ensure complete loading
        __syncthreads();

        // Compute partial matrix multiplication for the tile
        for (int k = 0; k < blockDim.x; ++k) {
            sum += As[threadIdx.y * blockDim.x + k] * Bs[k * blockDim.x + threadIdx.x];
        }

        // Synchronize before loading the next tile
        __syncthreads();
    }

    // Write result to global memory
    if ((Col < n) && (Row < n)) {
        c[Row * n + Col] = sum;
    }
}
```
