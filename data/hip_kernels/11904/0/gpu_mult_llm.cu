#include "hip/hip_runtime.h"
#include "includes.h"

#define B 1 // blocks in the grid
#define T 10 // threads in a block

#ifdef BAMBOO_PROFILING
#else
#endif

__global__ void gpu_mult(int *a, int *b, int *c, int N) {

    // Use shared memory for better data reuse and to minimize global memory accesses
    __shared__ int shared_a[T][T];
    __shared__ int shared_b[T][T];

    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int sum = 0;

    for (int tile = 0; tile < (N + T - 1) / T; ++tile) {
        // Load elements from global to shared memory
        if (row < N && tile * T + threadIdx.x < N) {
            shared_a[threadIdx.y][threadIdx.x] = a[row * N + tile * T + threadIdx.x];
        } else {
            shared_a[threadIdx.y][threadIdx.x] = 0;
        }

        if (tile * T + threadIdx.y < N && col < N) {
            shared_b[threadIdx.y][threadIdx.x] = b[(tile * T + threadIdx.y) * N + col];
        } else {
            shared_b[threadIdx.y][threadIdx.x] = 0;
        }

        // Synchronize to ensure all data is loaded to shared memory
        __syncthreads();

        // Compute partial sum for this tile
        for (int i = 0; i < T; ++i) {
            sum += shared_a[threadIdx.y][i] * shared_b[i][threadIdx.x];
        }

        // Ensure all threads have completed computation for this tile
        __syncthreads();
    }

    // Write the result to global memory
    if (row < N && col < N) {
        c[row * N + col] = sum;
    }
}