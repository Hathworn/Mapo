#include "hip/hip_runtime.h"
#include "includes.h"
__global__ static void mprts_update_offsets(int nr_total_blocks, uint* d_off, uint* d_spine_sums)
{
    int bid = threadIdx.x + THREADS_PER_BLOCK * blockIdx.x;

    // Optimization: Use early return to avoid extra branching
    if (bid > nr_total_blocks) return;

    // Fetch data from global memory efficiently
    int offset_index = bid * CUDA_BND_STRIDE;
    d_off[bid] = d_spine_sums[offset_index];
}