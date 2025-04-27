#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ker_sparse_to_dense_assign(int n, const unsigned int *idx, float *src, float *trg) {
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure within array bounds
    if (id < n) {
        trg[id] = src[idx[id]];
    }
}