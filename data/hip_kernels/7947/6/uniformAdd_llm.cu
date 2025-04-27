#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex) {
    __shared__ int uni;

    if (threadIdx.x == 0) {
        uni = uniforms[blockIdx.x + blockOffset];
    }

    __syncthreads();

    unsigned int address = __mul24(blockIdx.x, (blockDim.x << 1)) + baseIndex + threadIdx.x;

    // First add, all threads
    g_data[address] += uni;

    // Second add, only threads within the valid range
    if ((threadIdx.x + blockDim.x) < n) {
        g_data[address + blockDim.x] += uni;
    }
}