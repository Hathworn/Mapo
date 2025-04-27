#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cpy(int *a, int *b, int n) {
    // Calculate the global thread index
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Initialize shared memory for thread sums
    __shared__ int shared_sum[1024];
    shared_sum[threadIdx.x] = 0;

    // Perform operations in a loop with coalesced memory access pattern
    while (i < n) {
        shared_sum[threadIdx.x] += b[i];
        i += blockDim.x * gridDim.x;
    }
    
    // Synchronize threads within the block
    __syncthreads();
    
    // Reduce shared memory sums to a single sum
    if (threadIdx.x == 0) {
        int block_sum = 0;
        for (int j = 0; j < blockDim.x; j++) {
            block_sum += shared_sum[j];
        }
        atomicAdd(a, block_sum);
    }
}