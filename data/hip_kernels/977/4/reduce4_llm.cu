#include "hip/hip_runtime.h"
#include "includes.h"

template <unsigned int blockSize>
__device__ void warpReduce(volatile int* sdata, int tid) {
  if (blockSize >= 64) sdata[tid] += sdata[tid + 32];
  if (blockSize >= 32) sdata[tid] += sdata[tid + 16];
  if (blockSize >= 16) sdata[tid] += sdata[tid + 8];
  if (blockSize >= 8) sdata[tid] += sdata[tid + 4];
  if (blockSize >= 4) sdata[tid] += sdata[tid + 2];
  if (blockSize >= 2) sdata[tid] += sdata[tid + 1];
}

__global__ void reduce4(int *g_idata, int *g_odata) {
  extern __shared__ int sdata[];
  
  unsigned int tid = threadIdx.x;
  unsigned int i = blockIdx.x * (blockDim.x * 2) + threadIdx.x;
  
  // Load data into shared memory using a single read
  sdata[tid] = g_idata[i] + g_idata[i + blockDim.x];
  __syncthreads();

  // Reduce using a single loop up to 32 for warpReduce
  for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
    if (tid < s) {
      sdata[tid] += sdata[tid + s];
    }
    __syncthreads();
  }

  // Optimized warp reduction
  if (tid < 32) warpReduce<blockDim.x>(sdata, tid);

  // Write the result to global memory
  if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}