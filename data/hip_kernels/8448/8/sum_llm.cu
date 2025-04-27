#include "hip/hip_runtime.h"
#include "includes.h"

// Use shared memory for reducing global memory accesses
__global__ void sum(float *a, float *b, float *c, int n) {
  extern __shared__ float shared[];
  int index = blockDim.x * blockIdx.x + threadIdx.x;

  // Check if index is within bounds
  if (index < n) {
    // Load data into shared memory
    shared[threadIdx.x] = a[index];
    shared[threadIdx.x + blockDim.x] = b[index];
    __syncthreads();

    // Perform addition using shared memory
    c[index] = shared[threadIdx.x] + shared[threadIdx.x + blockDim.x];
  }
}