#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ker_sparse_to_dense_assign(int n, const unsigned int *idx, float *src, float *trg) {
    // Use shared memory to enhance data access efficiency
    extern __shared__ unsigned int s_idx[];

    // Get our global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Load indices into shared memory
    if (id < n)
        s_idx[threadIdx.x] = idx[id];

    __syncthreads(); // Synchronize threads to ensure all indices are loaded

    // Make sure we do not go out of bounds
    if (id < n)
        trg[id] = src[s_idx[threadIdx.x]]; // Use shared memory for efficient data access
}