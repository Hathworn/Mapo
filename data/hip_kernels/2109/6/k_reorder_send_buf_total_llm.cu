#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void k_reorder_send_buf_total(int nr_prts, int nr_total_blocks, uint *d_bidx, uint *d_sums, float4 *d_xi4, float4 *d_pxi4, float4 *d_xchg_xi4, float4 *d_xchg_pxi4) 
{
    // Use variables to store block and thread indices for better readability
    int thread_id = threadIdx.x + blockDim.x * blockIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Process particles in a strided loop to improve occupancy and handle larger arrays
    for (int i = thread_id; i < nr_prts; i += stride) {
        if (d_bidx[i] == CUDA_BND_S_OOB) {
            int j = d_sums[i];
            d_xchg_xi4[j]  = d_xi4[i];
            d_xchg_pxi4[j] = d_pxi4[i];
        }
    }
}