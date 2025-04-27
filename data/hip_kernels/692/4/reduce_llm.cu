#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int* s) {
  // Use warp-level intrinsic to sum values within a warp
  s[threadIdx.x] = p;
  __syncthreads();

  for (int offset = warpSize / 2; offset > 0; offset /= 2) {
    if (threadIdx.x < offset) {
      s[threadIdx.x] += s[threadIdx.x + offset];
    }
    __syncthreads();
  }

  // Return the sum stored at the first position
  return s[0];
}

__global__ void reduce(unsigned int* d_out_shared, const unsigned int* d_in) {
  extern __shared__ unsigned int s[];
  int t = threadIdx.x;
  int p = d_in[t];
  
  // Perform shared memory reduction
  unsigned int sr = shared_reduce(p, s);
  
  // Store the result from thread 0
  if (t == 0) {
    *d_out_shared = sr;
  }
}