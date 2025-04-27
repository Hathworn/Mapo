#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ker_dense_to_sparse_block_add(int n, const unsigned *idx, int bsize, float* src, float *trg) {
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Check that the threads don't exceed the bounds
    if (id < n * bsize) {
        int idx_base = idx[id / bsize] * bsize; // Calculate base index once
        int offset = id % bsize;                // Calculate offset once
        atomicAdd(trg + idx_base + offset, src[id]); // Perform atomic add
    }
}