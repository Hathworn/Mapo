#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void run_reduction(int *con, int *blockCon, int *ActiveList, int nActiveBlock, int *blockSizes)
{
    int list_idx = blockIdx.x;
    int tx = threadIdx.x;
    int block_idx = ActiveList[list_idx];
    int start = block_idx * blockDim.x * 2;
    int blocksize = blockSizes[block_idx];
    __shared__ int s_block_conv;
    
    // Initialize shared memory once for all threads in the block
    if (tx == 0) {
        s_block_conv = 1;
    }
    __syncthreads();
    
    // Use stride loop to allow all threads to check conditions
    for (int i = tx; i < blocksize; i += blockDim.x) {
        if (!con[start + i]) {
            atomicExch(&s_block_conv, 0);
        }
    }
    __syncthreads();

    // Write final result by the first thread
    if (tx == 0) {
        blockCon[block_idx] = s_block_conv; // active list is negation of tile convergence (active = not converged)
    }
}