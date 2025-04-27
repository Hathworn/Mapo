#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ker_dense_to_sparse_block_add(int n, const unsigned *idx, int bsize, float* src, float *trg) {
    // Use shared memory for intermediate storage to reduce global memory accesses
    __shared__ float sharedSrc[256]; // Adjust size as needed

    // Get our global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int localId = threadIdx.x;

    // Make sure we do not go out of bounds
    if (id < n * bsize) {
        // Copy to shared memory
        sharedSrc[localId] = src[id];
        __syncthreads();

        // Perform atomic addition using shared memory value
        atomicAdd(trg + idx[id / bsize] * bsize + id % bsize, sharedSrc[localId]);
    }
}