#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void mprts_update_offsets(int nr_total_blocks, uint *d_off, uint *d_spine_sums)
{
    // Load computation for blocks in shared memory
    int bid = threadIdx.x + THREADS_PER_BLOCK * blockIdx.x;
    
    if (bid < nr_total_blocks) { // Use less-than to avoid accessing out-of-bounds
        // Coalesced memory access
        d_off[bid] = __ldg(&d_spine_sums[bid * CUDA_BND_STRIDE]);
    }
}