#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculation(char *a, char *b, int *c, int constant, int vector_size) {

    int tid = (blockIdx.x * blockDim.x) + threadIdx.x;

    // Ensure thread is within bounds
    if (tid >= vector_size) return; 

    // Use shared memory for neighboring elements
    __shared__ char shared_a[blockDim.x + 2]; 

    // Load elements into shared memory
    shared_a[threadIdx.x + 1] = a[tid];

    if (threadIdx.x == 0) {
        shared_a[0] = a[tid > 0 ? tid - 1 : vector_size - 1]; // Load left neighbor
    }
    if (threadIdx.x == blockDim.x - 1 || tid == vector_size - 1) {
        shared_a[threadIdx.x + 2] = a[tid < vector_size - 1 ? tid + 1 : 0]; // Load right neighbor
    }

    __syncthreads(); // Synchronize to ensure all loads are complete

    // Do computation using shared memory
    int output_c = (shared_a[threadIdx.x] - shared_a[threadIdx.x + 2]) * b[tid] + shared_a[threadIdx.x + 1] * constant;

    // Write result
    c[tid] = output_c;
}