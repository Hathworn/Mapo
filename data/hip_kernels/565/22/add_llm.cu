#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c)
{
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to optimize memory access (assuming inputs are smaller than shared memory size)
    __shared__ int shared_a[256];  // Adjust size to match blockDim.x
    __shared__ int shared_b[256];

    // Load data into shared memory
    shared_a[threadIdx.x] = a[index];
    shared_b[threadIdx.x] = b[index];
    __syncthreads();

    // Perform addition using shared memory
    c[index] = shared_a[threadIdx.x] + shared_b[threadIdx.x];
}