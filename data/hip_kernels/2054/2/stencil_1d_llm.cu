```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void stencil_1d(int *in, int *out){

    // Allocate shared memory for the computation with halo
    __shared__ int temp[BLOCK_SIZE + 2 * RADIUS];

    int gindex = threadIdx.x + blockIdx.x * blockDim.x; // Global index
    int lindex = threadIdx.x + RADIUS; // Local index in shared memory with halo

    // Read input elements into shared memory
    // Critical to avoid bank conflicts is to access shared memory coalesced
    temp[lindex] = in[gindex]; // Center
    if (threadIdx.x < RADIUS) {
        temp[threadIdx.x] = in[gindex - RADIUS]; // Left halo
        temp[lindex + BLOCK_SIZE] = in[gindex + BLOCK_SIZE]; // Right halo
    }

    __syncthreads(); // Synchronize to make sure the data is available for all threads

    // Apply the stencil operation
    int result = 0;
    #pragma unroll
    for (int offset = -RADIUS; offset <= RADIUS; offset++) {
        result += temp[lindex + offset];
    }

    // Store the computed result to global memory
    out[gindex] = result;
}