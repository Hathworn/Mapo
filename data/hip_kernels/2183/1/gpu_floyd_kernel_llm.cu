#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_floyd_kernel(int k, int* adjacency_mtx, int* paths, int size)
{
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    if (col >= size) return;
    int idx = size * blockIdx.y + col;

    // Use shared memory to store the row elements to avoid repeated global memory access
    __shared__ int shared_row[1024]; // Assume maximum blockDim.x is 1024 or adjust accordingly

    if (threadIdx.x == 0) {
        shared_row[threadIdx.x] = adjacency_mtx[size * blockIdx.y + k];
    }
    __syncthreads();

    int best = shared_row[0];
    if (best == INF) return;

    int tmp_b = adjacency_mtx[k * size + col];
    if (tmp_b == INF) return;

    int cur = best + tmp_b;
    if (cur < adjacency_mtx[idx]) {
        adjacency_mtx[idx] = cur;
        paths[idx] = k;
    }
}