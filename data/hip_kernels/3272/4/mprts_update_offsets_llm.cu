#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void mprts_update_offsets(int nr_total_blocks, uint* d_off, uint* d_spine_sums)
{
  // Calculate global thread index
  int bid = threadIdx.x + THREADS_PER_BLOCK * blockIdx.x;

  // Ensure to stay within bounds
  if (bid < nr_total_blocks) {
    // Read and update offsets
    d_off[bid] = d_spine_sums[bid * CUDA_BND_STRIDE];
  }
}