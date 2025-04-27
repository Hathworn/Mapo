#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void k_count_received(int nr_total_blocks, uint *d_n_recv_by_block, uint *d_spine_cnts)
{
    int bid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure within bounds before accessing array
    if (bid < nr_total_blocks) {
        int index = bid * 10 + CUDA_BND_S_NEW;
        d_spine_cnts[index] = d_n_recv_by_block[bid];
    }
}