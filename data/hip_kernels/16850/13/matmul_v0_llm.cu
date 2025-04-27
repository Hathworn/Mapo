#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matmul_v0(float* a, float* b, float* c, int n) {
    // C(nxn) = A(nxn) * B(nxn);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    if (i >= n || j >= n) return;

    float c_ij = 0;

    // Use shared memory to load A and B tiles
    __shared__ float Asub[TILE_SIZE][TILE_SIZE];
    __shared__ float Bsub[TILE_SIZE][TILE_SIZE];

    for (int tile = 0; tile < n / TILE_SIZE; ++tile) {
        // Load data into shared memory
        Asub[threadIdx.y][threadIdx.x] = a[n * j + tile * TILE_SIZE + threadIdx.x];
        Bsub[threadIdx.y][threadIdx.x] = b[n * (tile * TILE_SIZE + threadIdx.y) + i];

        __syncthreads(); // Wait for all threads to load their parts

        // Accumulate the results
        for (int k = 0; k < TILE_SIZE; ++k) {
            c_ij += Asub[threadIdx.y][k] * Bsub[k][threadIdx.x];
        }

        __syncthreads(); // Wait for all threads to finish calculation
    }

    c[n * j + i] = c_ij; // Store the result
}
```
