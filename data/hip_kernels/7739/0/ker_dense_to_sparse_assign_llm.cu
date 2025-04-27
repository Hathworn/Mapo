#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ker_dense_to_sparse_assign(int n, const unsigned int *idx, float *src, float *trg) {
    // Calculate the thread ID using faster intrinsic functions
    int id = __umul24(blockIdx.x, blockDim.x) + threadIdx.x;
    
    // Avoid out-of-bounds errors
    if (id < n) {
        trg[idx[id]] = src[id];
    }
}