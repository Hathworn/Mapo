#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void k_reorder_send_buf_total(int nr_prts, int nr_total_blocks, uint *d_bidx, uint *d_sums, float4 *d_xi4, float4 *d_pxi4, float4 *d_xchg_xi4, float4 *d_xchg_pxi4)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= nr_prts) return;

    // Use a register to cache frequently used data
    uint bidx = d_bidx[i];
    
    // Optimize by removing redundant global memory accesses
    if (bidx == CUDA_BND_S_OOB) {
        int j = d_sums[i];
        
        // Coalesced memory writes
        float4 xi = d_xi4[i];
        float4 pxi = d_pxi4[i];
        
        d_xchg_xi4[j]  = xi;
        d_xchg_pxi4[j] = pxi;
    }
}