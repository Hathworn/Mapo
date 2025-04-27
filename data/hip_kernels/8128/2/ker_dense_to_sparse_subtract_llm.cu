#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ker_dense_to_sparse_subtract(int n, const unsigned int *idx, float *src, float *trg) {
    // Use a more efficient method to calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread is within bounds and directly update the target array
    if (id < n) {
        atomicAdd(&trg[idx[id]], -src[id]);
    }
}