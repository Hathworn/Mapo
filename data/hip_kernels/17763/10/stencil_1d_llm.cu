#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencil_1d(int *in, int *out) {
    __shared__ int temp[BLOCK_SIZE + 2 * RADIUS];

    // Calculate global and local index for current thread
    int gindex = threadIdx.x + (blockIdx.x * blockDim.x) + RADIUS;
    int lindex = threadIdx.x + RADIUS;

    // Load current element and halo into shared memory
    temp[lindex] = in[gindex];
    if (threadIdx.x < RADIUS) {
        temp[lindex - RADIUS] = in[gindex - RADIUS];
        temp[lindex + BLOCK_SIZE] = in[gindex + BLOCK_SIZE];
    }

    // Synchronize threads to ensure shared memory is fully populated
    __syncthreads();

    // Compute the result using stencil pattern
    int result = 0;
    #pragma unroll // Unroll loop to optimize performance
    for (int offset = -RADIUS; offset <= RADIUS; offset++) {
        result += temp[lindex + offset];
    }

    // Store the computed result in global memory
    out[gindex - RADIUS] = result;
}