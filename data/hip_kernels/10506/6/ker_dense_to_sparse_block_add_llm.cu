#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ker_dense_to_sparse_block_add(int n, const unsigned *idx, int bsize, float* src, float *trg) {
    // Calculate the global index and the corresponding sparse block index once
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < n * bsize) {
        // Use a register to avoid multiple index calculations for the same thread
        int blockIndex = idx[id / bsize];
        int offset = id % bsize;
        // Perform atomic addition with pre-calculated index
        atomicAdd(trg + blockIndex * bsize + offset, src[id]);
    }
}