#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculation(int *a, int *b, int *c, int constant, int vector_size) {
    int tid = (blockIdx.x * blockDim.x) + threadIdx.x;

    if (tid < vector_size) {
        // Calculate indices with modulo to avoid branching
        int prev_tid = (tid + vector_size - 1) % vector_size;
        int post_tid = (tid + 1) % vector_size;

        // Read in inputs
        int prev_a = a[prev_tid];
        int curr_a = a[tid];
        int post_a = a[post_tid];

        int curr_b = b[tid];
        
        // Do computation
        int output_c = (prev_a - post_a) * curr_b + curr_a * constant;

        // Write result
        c[tid] = output_c;
    }
}