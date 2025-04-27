#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ker_sparse_to_dense_block_assign_and_multiply(int n, const unsigned *idx, int bsize, float mult, float* src, float *trg) {
    // Use shared memory to reduce global memory accesses
    extern __shared__ float shared_src[];
    
    // Calculate block and thread-specific indices
    int thread_id = threadIdx.x;
    int block_offset = blockIdx.x * bsize;
    
    // Load data into shared memory
    int data_idx = idx[blockIdx.x] * bsize + thread_id;
    if(thread_id < bsize) {
        shared_src[thread_id] = src[data_idx];
    }
    __syncthreads();

    // Perform the computation if within bounds
    int id = block_offset + thread_id;
    if(id < n * bsize) {
        trg[id] = shared_src[thread_id] * mult;
    }
}