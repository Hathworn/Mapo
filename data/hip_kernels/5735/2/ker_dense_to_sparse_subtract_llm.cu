```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ker_dense_to_sparse_subtract(int n, const unsigned int *idx, float *src, float *trg) {
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds before atomic operation
    if (id < n) {
        // Subtract src[id] from trg[idx[id]] using atomic operation
        atomicAdd(&trg[idx[id]], -src[id]);
    }
}