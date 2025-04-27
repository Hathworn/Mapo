#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void k_count_received(int nr_total_blocks, uint* d_n_recv_by_block, uint* d_spine_cnts)
{
    int bid = blockIdx.x * blockDim.x + threadIdx.x;

    if (bid < nr_total_blocks) {
        // Coalesce memory access by using stride of 1
        uint recv_count = d_n_recv_by_block[bid];
        d_spine_cnts[bid * 10 + CUDA_BND_S_NEW] = recv_count;
    }
}