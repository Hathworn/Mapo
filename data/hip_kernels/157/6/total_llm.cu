#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 256

__global__ void total(float * input, float * output, int len) {
    // Allocate shared memory dynamically
    extern __shared__ float partialSum[];

    unsigned int tx = threadIdx.x;
    unsigned int start = 2 * blockIdx.x * BLOCK_SIZE;

    // Initialize shared memory with input values or zero if out of bounds
    if ((start + tx) < len) {
        partialSum[tx] = input[start + tx];
    } else {
        partialSum[tx] = 0.0;
    }
    if ((start + BLOCK_SIZE + tx) < len) {
        partialSum[BLOCK_SIZE + tx] = input[start + BLOCK_SIZE + tx];
    } else {
        partialSum[BLOCK_SIZE + tx] = 0.0;
    }

    // Reduce the values in shared memory
    for (unsigned int stride = BLOCK_SIZE; stride > 0; stride /= 2) {
        __syncthreads();
        if (tx < stride) {
            partialSum[tx] += partialSum[tx + stride];
        }
    }

    // Store the result in the output array
    if (tx == 0) {
        output[blockIdx.x] = partialSum[0];
    }
}