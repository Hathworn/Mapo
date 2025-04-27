#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Add(float *A, int size)
{
    // Cache grid and block dimensions
    const unsigned int block_size = blockDim.x;
    const unsigned int grid_size = gridDim.x;
    const unsigned int total_threads = block_size * grid_size;

    // Calculate global thread index
    const int global_idx = blockIdx.x * block_size + threadIdx.x;

    // Loop over elements with stride equal to total number of threads
    for (unsigned int i = global_idx; i < size; i += total_threads) {
        A[i] += A[i];
    }
}