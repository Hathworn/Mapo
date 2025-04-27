#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ker_dense_to_sparse_block_add(int n, const unsigned *idx, int bsize, float* src, float *trg) {
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure only valid threads process the data
    if (id < n * bsize) {
        // Pre-calculate indices for more efficient memory access
        int block_id = id / bsize;
        int offset = id % bsize;
        int target_index = idx[block_id] * bsize + offset;
        
        // Perform atomic addition to prevent race conditions
        atomicAdd(&trg[target_index], src[id]);
    }
}