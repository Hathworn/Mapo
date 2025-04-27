#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void mprts_update_offsets(int nr_total_blocks, uint *d_off, uint *d_spine_sums)
{
    // Calculate global thread index
    int bid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if (bid < nr_total_blocks) {
        // Update offset for the current block
        d_off[bid] = d_spine_sums[bid * CUDA_BND_STRIDE];
    }
}