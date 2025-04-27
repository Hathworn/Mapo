```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 1024
#define RADIUS 1

__global__ void stencil_ld(unsigned *in, unsigned *out) {
    // Optimized version using shared memory for better data locality
    __shared__ unsigned temp[BLOCK_SIZE + 2 * RADIUS];
    int gindex = threadIdx.x + blockIdx.x * blockDim.x;
    int lindex = threadIdx.x + RADIUS;

    // Load data into shared memory
    temp[lindex] = in[gindex];

    if (threadIdx.x < RADIUS) {
        temp[lindex - RADIUS] = in[gindex - RADIUS];
        temp[lindex + BLOCK_SIZE] = in[gindex + BLOCK_SIZE];
    }

    __syncthreads(); // Ensure all threads have loaded their elements

    // Perform computation using shared memory
    int result = 0;
    for (int offset = -RADIUS; offset <= RADIUS; offset++) {
        result += temp[lindex + offset];
    }

    // Store result
    out[gindex] = result;
}