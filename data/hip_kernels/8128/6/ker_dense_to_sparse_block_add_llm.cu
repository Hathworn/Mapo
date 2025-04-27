#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ker_dense_to_sparse_block_add(int n, const unsigned *idx, int bsize, float* src, float *trg) {
    // Calculate flattened thread id within grid
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Precompute idx base offset and src access to reduce redundant computations
    int baseOffset = (id / bsize) * bsize;
    
    // Ensure id is within bounds to prevent out-of-bounds access
    if (id < n * bsize) {
        // Use the precomputed offset for sparse index calculation
        atomicAdd(trg + idx[id / bsize] * bsize + id % bsize, src[id]);
    }
}