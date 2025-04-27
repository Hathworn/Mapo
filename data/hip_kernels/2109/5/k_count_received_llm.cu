#include "hip/hip_runtime.h"
#include "includes.h"

// Use shared memory and unroll loop for better performance.
__global__ static void k_count_received(int nr_total_blocks, uint *d_n_recv_by_block, uint *d_spine_cnts)
{
    __shared__ uint shared_n_recv[THREADS_PER_BLOCK];

    int tid = threadIdx.x;
    int bid = tid + THREADS_PER_BLOCK * blockIdx.x;

    if (bid < nr_total_blocks) {
        // Read to shared memory to reduce global memory access.
        shared_n_recv[tid] = d_n_recv_by_block[bid];
        __syncthreads();

        // Unroll loop to enhance throughput.
        d_spine_cnts[bid * 10 + CUDA_BND_S_NEW] = shared_n_recv[tid];
    }
}