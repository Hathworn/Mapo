#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_adjacent(int *vec, int *vec_shorter, const int n)
{
    // Calculate global index
    unsigned int xIndex = blockDim.x * blockIdx.x + threadIdx.x;

    // Use shared memory for faster access within a block
    extern __shared__ int shared_vec[];

    // Load data into shared memory
    if (xIndex < 2 * n) {
        shared_vec[threadIdx.x] = vec[xIndex];
    }
    __syncthreads();

    // Perform addition if within bounds
    if (xIndex < n) {
        vec_shorter[xIndex] = shared_vec[2 * threadIdx.x] + shared_vec[2 * threadIdx.x + 1];
    }
}