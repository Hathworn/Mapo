#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpuMatMul(float *a, float *b, float *c, int m, int n, int p) {
    // Calculate row index of the element
    uint row = blockDim.y * blockIdx.y + threadIdx.y;
    // Calculate column index of the element
    uint col = blockDim.x * blockIdx.x + threadIdx.x;

    // Check if each thread needs to proceed with the calculations
    if (row < m && col < p) {
        float val = 0.0f;

        // Use shared memory for tiling to improve data reuse
        __shared__ float shared_a[BLOCK_SIZE][BLOCK_SIZE];
        __shared__ float shared_b[BLOCK_SIZE][BLOCK_SIZE];
        
        for (int k = 0; k < (n + BLOCK_SIZE - 1) / BLOCK_SIZE; ++k) {
            if (k * BLOCK_SIZE + threadIdx.x < n && row < m) {
                shared_a[threadIdx.y][threadIdx.x] = a[row * n + k * BLOCK_SIZE + threadIdx.x];
            } else {
                shared_a[threadIdx.y][threadIdx.x] = 0.0f;
            }

            if (k * BLOCK_SIZE + threadIdx.y < n && col < p) {
                shared_b[threadIdx.y][threadIdx.x] = b[(k * BLOCK_SIZE + threadIdx.y) * p + col];
            } else {
                shared_b[threadIdx.y][threadIdx.x] = 0.0f;
            }

            // Synchronize to ensure all data is loaded before computation
            __syncthreads();
            
            // Compute partial product for this block and add to accumulator
            for (int e = 0; e < BLOCK_SIZE; ++e) {
                val += shared_a[threadIdx.y][e] * shared_b[e][threadIdx.x];
            }

            // Synchronize to ensure all computations finished before loading next tile
            __syncthreads();
        }
        
        // Store the result
        c[row * p + col] = val;
    }
}
```
