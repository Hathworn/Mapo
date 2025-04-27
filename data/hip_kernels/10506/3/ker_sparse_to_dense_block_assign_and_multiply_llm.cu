#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ker_sparse_to_dense_block_assign_and_multiply(int n, const unsigned *idx, int bsize, float mult, float* src, float *trg) {
    // Use shared memory to optimize memory access
    __shared__ unsigned shared_idx[256];
    
    // Each thread loads one index into shared memory
    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + tid;

    if (tid < bsize) {
        shared_idx[tid] = idx[blockIdx.x * bsize + tid];
    }
    __syncthreads();

    // Calculate the target index in the output array
    int global_index = i * bsize + tid;

    // Check array bounds and perform computation
    if (i < n) {
        trg[global_index] = src[shared_idx[tid] * bsize + tid] * mult;
    }
}