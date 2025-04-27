#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ker_sparse_to_dense_block_assign_and_multiply(int n, const unsigned *idx, int bsize, float mult, float* src, float *trg) {
    // Get our global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate the source index
    int src_index = idx[id / bsize] * bsize + id % bsize;

    // Make sure we do not go out of bounds
    if (id < n * bsize) {
        // Perform multiplication and assignment
        trg[id] = src[src_index] * mult;
    }
}