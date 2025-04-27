#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ker_sparse_to_dense_assign(int n, const unsigned int *idx, float *src, float *trg) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < n) {
        // Use registers to store intermediate values which might improve performance slightly
        unsigned int srcIdx = idx[id];
        float value = src[srcIdx];
        trg[id] = value;
    }
}