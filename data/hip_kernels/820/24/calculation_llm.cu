#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculation(char *a, char *b, int *c, int constant, int vector_size) {

    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure valid thread index
    if (tid < vector_size) {

        // Efficient memory access using shared memory
        extern __shared__ char shared_a[];

        // Load shared data
        shared_a[threadIdx.x] = a[tid];
        
        // Handle boundary conditions
        char prev_a, post_a;

        if (threadIdx.x == 0) {
            prev_a = tid > 0 ? a[tid - 1] : a[vector_size - 1];
        } else {
            prev_a = shared_a[threadIdx.x - 1];
        }

        if (threadIdx.x == blockDim.x - 1 || tid == vector_size - 1) {
            post_a = tid < (vector_size - 1) ? a[tid + 1] : a[0];
        } else {
            post_a = shared_a[threadIdx.x + 1];
        }

        char curr_b = b[tid];

        // Perform computation with reduced arithmetic operations
        int output_c = (prev_a - post_a) * curr_b + shared_a[threadIdx.x] * constant;

        // Store the result
        c[tid] = output_c;
    }
}