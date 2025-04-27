#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMultiply(double *a, double *b, double *c, int cr, int cc, int ac, int bc) {
    // Use shared memory for better memory access coalescing
    __shared__ double shared_a[TILE_SIZE][TILE_SIZE];
    __shared__ double shared_b[TILE_SIZE][TILE_SIZE];

    // Calculate row and column index of the element
    long x = blockIdx.x * blockDim.x + threadIdx.x; // col
    long y = blockIdx.y * blockDim.y + threadIdx.y; // row
    double sum = 0;

    // Iterate over tiles
    for (int t = 0; t < (ac + TILE_SIZE - 1) / TILE_SIZE; t++) {
        // Load data into shared memory
        if (y < cr && t * TILE_SIZE + threadIdx.x < ac) {
            shared_a[threadIdx.y][threadIdx.x] = a[y * ac + t * TILE_SIZE + threadIdx.x];
        } else {
            shared_a[threadIdx.y][threadIdx.x] = 0.0;
        }
        
        if (x < cc && t * TILE_SIZE + threadIdx.y < ac) {
            shared_b[threadIdx.y][threadIdx.x] = b[(t * TILE_SIZE + threadIdx.y) * bc + x];
        } else {
            shared_b[threadIdx.y][threadIdx.x] = 0.0;
        }

        __syncthreads(); // Synchronize threads to ensure complete tile load

        // Accumulate partial result
        for (int k = 0; k < TILE_SIZE; k++) {
            sum += shared_a[threadIdx.y][k] * shared_b[k][threadIdx.x];
        }

        __syncthreads(); // Synchronize threads before loading new tile
    }

    // Write result to the matrix
    if (x < cc && y < cr) {
        c[y * cc + x] = sum;
    }
}