#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void device_add(int *a, int *b, int *c) {
    // Compute the global index once and reuse it
    int index = threadIdx.x + blockIdx.x * blockDim.x;

    // Optimize memory access by using shared memory
    __shared__ int temp_a[1024];
    __shared__ int temp_b[1024];

    // Load data into shared memory
    temp_a[threadIdx.x] = a[index];
    temp_b[threadIdx.x] = b[index];
  
    // Ensure all threads have loaded their data
    __syncthreads();

    // Perform addition using shared memory
    c[index] = temp_a[threadIdx.x] + temp_b[threadIdx.x];
}