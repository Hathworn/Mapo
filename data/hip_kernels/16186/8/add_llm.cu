#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c) {
    // Use shared memory for faster data access
    __shared__ int shared_a[256];
    __shared__ int shared_b[256];

    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int local_index = threadIdx.x;

    // Load data into shared memory
    shared_a[local_index] = a[index];
    shared_b[local_index] = b[index];
    __syncthreads();

    // Perform addition using shared memory
    c[index] = shared_a[local_index] + shared_b[local_index];
}