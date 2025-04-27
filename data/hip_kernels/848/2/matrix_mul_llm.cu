#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_mul(float *ad, float *bd, float *cd, int N) {
    // Use shared memory for faster access
    __shared__ float ad_shared[TILE_SIZE][TILE_SIZE];
    __shared__ float bd_shared[TILE_SIZE][TILE_SIZE];

    // Compute row and column for each thread
    int Row = blockIdx.y * blockDim.y + threadIdx.y;
    int Col = blockIdx.x * blockDim.x + threadIdx.x;

    float pvalue = 0;

    // Loop through tiles of the matrices
    for (int t = 0; t < N / TILE_SIZE; ++t) {
        // Load data into shared memory
        ad_shared[threadIdx.y][threadIdx.x] = ad[Row * N + t * TILE_SIZE + threadIdx.x];
        bd_shared[threadIdx.y][threadIdx.x] = bd[(t * TILE_SIZE + threadIdx.y) * N + Col];
        
        // Synchronize threads in block after loading data
        __syncthreads();

        // Compute partial product for the tile
        for (int i = 0; i < TILE_SIZE; ++i) {
            pvalue += ad_shared[threadIdx.y][i] * bd_shared[i][threadIdx.x];
        }

        // Synchronize threads to ensure calculation is done before loading new data
        __syncthreads();
    }

    // Write result to the output matrix
    cd[Row * N + Col] = pvalue;
}
```
