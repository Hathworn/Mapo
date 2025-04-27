#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function with coalesced memory access
__global__ void ker_dense_to_sparse_subtract(int n, const unsigned int *idx, float *src, float *trg) {
    // Get our global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Coalesced memory access and prevent out-of-bounds access
    if (id < n) {
        unsigned int target_idx = idx[id];
        float src_val = src[id];
        atomicAdd(&trg[target_idx], -src_val);
    }
}