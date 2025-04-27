#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void k_reorder_send_buf_total(int nr_prts, int nr_total_blocks, uint *d_bidx, uint *d_sums, float4 *d_xi4, float4 *d_pxi4, float4 *d_xchg_xi4, float4 *d_xchg_pxi4)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified thread index calculation
    if (i >= nr_prts) return;  // Early exit if out of bounds

    if (d_bidx[i] == CUDA_BND_S_OOB) {
        int j = d_sums[i];  // Fetch the destination index
        d_xchg_xi4[j]  = d_xi4[i];  // Reorder xi4
        d_xchg_pxi4[j] = d_pxi4[i];  // Reorder pxi4
    }
}