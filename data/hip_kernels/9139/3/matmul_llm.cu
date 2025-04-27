#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matmul(double *a, double *b, double *c, int n)
{
    // Cache block's shared memory space
    extern __shared__ double shared[];

    // Define sub-matrix dimensions
    int tile_size = blockDim.x;

    // Calculate matrix indices
    int Row = blockIdx.y * tile_size + threadIdx.y;
    int Col = blockIdx.x * tile_size + threadIdx.x;

    // Initialize sum accumulator
    double sum = 0.0;

    // Iterate over sub-matrix blocks
    for(int i = 0; i < n; i += tile_size) {
        // Load elements into shared memory
        shared[threadIdx.y * tile_size + threadIdx.x] = (Row < n && (i + threadIdx.x) < n) ? a[Row * n + i + threadIdx.x] : 0.0;
        shared[tile_size * tile_size + threadIdx.y * tile_size + threadIdx.x] = ((i + threadIdx.y) < n && Col < n) ? b[(i + threadIdx.y) * n + Col] : 0.0;

        // Synchronize within block
        __syncthreads();

        // Multiply and accumulate sub-matrix
        for(int j = 0; j < tile_size; j++) {
            sum += shared[threadIdx.y * tile_size + j] * shared[tile_size * tile_size + j * tile_size + threadIdx.x];
        }

        // Synchronize within block
        __syncthreads();
    }

    // Write result to global memory
    if(Row < n && Col < n) {
        c[Row * n + Col] = sum;
    }
}