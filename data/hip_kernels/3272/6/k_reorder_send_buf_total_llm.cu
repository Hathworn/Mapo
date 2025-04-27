#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void k_reorder_send_buf_total(int nr_prts, int nr_total_blocks, uint* d_bidx, uint* d_sums, float4* d_xi4, float4* d_pxi4, float4* d_xchg_xi4, float4* d_xchg_pxi4) 
{
    int i = threadIdx.x + THREADS_PER_BLOCK * blockIdx.x;

    // Early exit if thread index exceeds number of particles
    if (i >= nr_prts) return;

    // Only proceed if particle is out-of-bounds
    if (d_bidx[i] == CUDA_BND_S_OOB) 
    {   
        // Use shared memory optimization
        __shared__ float4 shared_xi4[THREADS_PER_BLOCK];
        __shared__ float4 shared_pxi4[THREADS_PER_BLOCK];

        // Load data into shared memory
        shared_xi4[threadIdx.x] = d_xi4[i];
        shared_pxi4[threadIdx.x] = d_pxi4[i];

        // Ensure all threads have loaded their data
        __syncthreads();

        // Write data from shared to global memory
        int j = d_sums[i];
        d_xchg_xi4[j] = shared_xi4[threadIdx.x];
        d_xchg_pxi4[j] = shared_pxi4[threadIdx.x];
    }
}
```
