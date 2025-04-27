#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ker_dense_to_sparse_assign(int n, const unsigned int *idx, float *src, float *trg) {
    // Get our global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Early return optimization to avoid branching
    if (id >= n) return;

    // Direct assignment for in-bounds thread
    trg[idx[id]] = src[id];
}