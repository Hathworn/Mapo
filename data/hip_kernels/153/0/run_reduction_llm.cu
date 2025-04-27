#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void run_reduction(bool *con, bool *blockCon, int* ActiveList, int nActiveBlock, int* blockSizes) {
    int list_idx = blockIdx.y * gridDim.x + blockIdx.x;
    int maxblocksize = blockDim.x;
    int tx = threadIdx.x;
    int block_idx = ActiveList[list_idx];
    int blocksize = blockSizes[block_idx];

    __shared__ bool s_block_conv;

    // Initialize shared memory using the first thread in the block
    if (tx == 0) {
        s_block_conv = true;
    }
    __syncthreads();

    // Perform checks on all participating threads
    if (tx < blocksize) {
        if (!con[maxblocksize * block_idx + tx]) {
            atomicAnd(&s_block_conv, false); // Use atomic operation for shared memory
        }
    }
    __syncthreads();

    // Write the result to global memory
    if (tx == 0) {
        blockCon[block_idx] = s_block_conv;
    }
}