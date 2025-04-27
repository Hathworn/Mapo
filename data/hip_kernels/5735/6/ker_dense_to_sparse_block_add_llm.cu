#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ker_dense_to_sparse_block_add(int n, const unsigned *idx, int bsize, float* src, float *trg) {
    // Get global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure we are within bounds for processing
    if (id < n * bsize) {
        // Calculate target index and perform atomic addition for concurrency safety
        atomicAdd(&trg[idx[id / bsize] * bsize + id % bsize], src[id]);
    }
}