#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void total(float *input, float *output, int len) {
    __shared__ float partialSum[2 * BLOCK_SIZE];
    unsigned int t = threadIdx.x, start = 2 * blockIdx.x * BLOCK_SIZE;

    // Load elements into shared memory, using a single conditional
    partialSum[t] = (start + t < len) ? input[start + t] : 0;
    partialSum[BLOCK_SIZE + t] = (start + BLOCK_SIZE + t < len) ? input[start + BLOCK_SIZE + t] : 0;
    __syncthreads();

    // Reduce the shared memory array
    for (unsigned int stride = BLOCK_SIZE; stride >= 1; stride >>= 1) {
        if (t < stride) {
            partialSum[t] += partialSum[t + stride];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (t == 0) {
        output[blockIdx.x] = partialSum[0];
    }
}