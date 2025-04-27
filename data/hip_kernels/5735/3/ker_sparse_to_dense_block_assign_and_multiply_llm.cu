#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ker_sparse_to_dense_block_assign_and_multiply(int n, const unsigned *idx, int bsize, float mult, float* src, float *trg) {
    // Optimized global thread ID calculation
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure in-bounds access and operate efficiently
    if (id < n * bsize) {
        int base_idx = idx[id / bsize] * bsize; // Precompute for efficiency
        trg[id] = src[base_idx + id % bsize] * mult;
    }
}