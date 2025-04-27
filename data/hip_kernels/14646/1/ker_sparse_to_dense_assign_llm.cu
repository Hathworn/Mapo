#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ker_sparse_to_dense_assign(int n, const unsigned int *idx, float *src, float *trg) {
    // Calculate our global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we are within bounds before accessing memory
    if (id < n) {
        // Fetch and assign without redundant memory access
        unsigned int index = idx[id];
        trg[id] = src[index];
    }
}