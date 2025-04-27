#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ker_dense_to_sparse_subtract(int n, const unsigned int *idx, float *src, float *trg) {
    // Optimize grid and block calculation for better performance
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use loop to process multiple elements per thread
    for (int i = id; i < n; i += stride) {
        atomicAdd(trg + idx[i], -src[i]);
    }
}