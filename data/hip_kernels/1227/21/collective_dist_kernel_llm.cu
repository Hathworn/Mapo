#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double get_collective_dist(int *dist, int rows, int cols, int col) {
    double sum = 0;
    for (int i = 0; i < rows; i++) {
        if (dist[i * cols + col] == 0) {
            return 0;
        }
        sum += (1 / (double)dist[i * cols + col]);
    }
    return sum;
}

__global__ void collective_dist_kernel(int *dist, int rows, int cols, double *col_dist)
{
    // Compute global thread id for unique thread indexing
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride loop for better memory coalescing and data access pattern
    for (int col = tid; col < cols; col += blockDim.x * gridDim.x) {
        col_dist[col] = get_collective_dist(dist, rows, cols, col);
    }
}