#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculation(char *a, char *b, int *c, int constant, int vector_size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; 

    if (tid < vector_size) {
        // Using shared memory to improve memory access efficiency
        extern __shared__ char shared_a[];

        // Load data into shared memory
        shared_a[threadIdx.x] = a[tid];
        if (threadIdx.x == 0) {
            shared_a[blockDim.x] = a[tid > 0 ? tid - 1 : (vector_size - 1)];
            shared_a[blockDim.x + 1] = a[tid < (vector_size - 1) ? tid + 1 : 0];
        }
        __syncthreads();

        // Compute indices for previous and post elements
        char prev_a = shared_a[threadIdx.x == 0 ? blockDim.x : threadIdx.x - 1];
        char curr_a = shared_a[threadIdx.x];
        char post_a = shared_a[threadIdx.x == blockDim.x - 1 ? blockDim.x + 1 : threadIdx.x + 1];

        char curr_b = b[tid];

        // Do computation
        int output_c = (prev_a - post_a) * curr_b + curr_a * constant;

        // Write result
        c[tid] = output_c;
    }
}