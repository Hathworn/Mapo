```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ker_sparse_to_dense_assign(int n, const unsigned int *idx, float *src, float *trg) {
    // Use faster blockStride loop method for optimal memory access
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    for (int i = id; i < n; i += stride) {
        trg[i] = src[idx[i]];
    }
}