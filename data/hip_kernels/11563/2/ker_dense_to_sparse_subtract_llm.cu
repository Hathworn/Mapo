#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ker_dense_to_sparse_subtract(int n, const unsigned int *idx, float *src, float *trg) {
    // Utilize shared memory to optimize atomic operations
    __shared__ float cache[BLOCK_SIZE];
    int id = blockIdx.x*blockDim.x + threadIdx.x;

    if (id < n) {
        // Cache the subtraction result
        cache[threadIdx.x] = -src[id];
        __syncthreads();

        // Perform atomic addition with cached value
        if (threadIdx.x == 0) {
            for (int i = 0; i < blockDim.x; ++i) {
                atomicAdd(trg + idx[blockIdx.x * blockDim.x + i], cache[i]);
            }
        }
        __syncthreads();
    }
}