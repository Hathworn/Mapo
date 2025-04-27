#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void mprts_update_offsets(int nr_total_blocks, uint *d_off, uint *d_spine_sums)
{
    // Calculate the global index of the thread
    int bid = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the thread is within bounds
    if (bid < nr_total_blocks) {
        // Load spine sums and store to d_off
        d_off[bid] = d_spine_sums[bid * CUDA_BND_STRIDE];
    }
}