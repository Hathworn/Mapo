#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ker_sparse_to_dense_block_assign_and_multiply(int n, const unsigned *idx, int bsize, float mult, float* src, float *trg) {
    // Get the global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate the block and element indices
    int block_id = id / bsize;
    int element_id = id % bsize;

    // Perform bounds check and assignment with multiplication
    if (block_id < n) {
        trg[id] = src[idx[block_id] * bsize + element_id] * mult;
    }
}