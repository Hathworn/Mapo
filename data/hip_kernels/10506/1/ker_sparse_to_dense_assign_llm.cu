#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ker_sparse_to_dense_assign(int n, const unsigned int *idx, float *src, float *trg) {
    // Use shared memory for improved access patterns
    __shared__ unsigned int shared_idx[256];
    __shared__ float shared_src[256];

    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load from global to shared memory
    if (id < n) {
        shared_idx[threadIdx.x] = idx[id];
        shared_src[threadIdx.x] = src[shared_idx[threadIdx.x]];
        __syncthreads();
        
        // Copy from shared to global memory
        trg[id] = shared_src[threadIdx.x];
    }
}