#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_block(int *a, int *b, int *c) {
    // Use shared memory to optimize memory access within a block
    __shared__ int shared_a;
    __shared__ int shared_b;
    
    shared_a = a[blockIdx.x];
    shared_b = b[blockIdx.x];
    
    __syncthreads();  // Ensure all threads have loaded data
    
    // Perform the addition
    c[blockIdx.x] = shared_a + shared_b;
}