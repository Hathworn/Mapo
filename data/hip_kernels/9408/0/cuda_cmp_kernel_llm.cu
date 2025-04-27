#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_cmp_kernel(std::size_t n, int* aptr, int* bptr, int* rptr) {
  // Calculate global thread index 
  int i = threadIdx.x + blockIdx.x * blockDim.x;

  // Initialize shared memory to store comparison result
  __shared__ int result;

  if (threadIdx.x == 0) result = 0;

  __syncthreads();
  
  // Perform comparison, store result in shared memory
  if (i < n) {
      atomicOr(&result, aptr[i] < bptr[i]);
  }

  __syncthreads();

  // Write the final result to global memory from one thread
  if (threadIdx.x == 0 && result) {
      *rptr = 1;
  }
}