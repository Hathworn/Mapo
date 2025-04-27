```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void k_reorder_send_buf_total(int nr_prts, int nr_total_blocks, uint* d_bidx, uint* d_sums, float4* d_xi4, float4* d_pxi4, float4* d_xchg_xi4, float4* d_xchg_pxi4)
{
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Return early if thread index exceeds total particles
    if (i >= nr_prts)
        return;

    // Avoid unnecessary memory accesses by checking the condition first
    if (d_bidx[i] == CUDA_BND_S_OOB) {
        int j = d_sums[i];
        
        // Use one memory transaction per float4 element
        d_xchg_xi4[j] = d_xi4[i];
        d_xchg_pxi4[j] = d_pxi4[i];
    }
}