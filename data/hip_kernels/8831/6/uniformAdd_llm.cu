#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex) {
    __shared__ float uni;
    // Load shared memory once per block
    if (threadIdx.x == 0) {
        uni = uniforms[blockIdx.x + blockOffset];
    }

    unsigned int address = __mul24(blockIdx.x, (blockDim.x << 1)) + baseIndex + threadIdx.x;

    __syncthreads();

    // Add shared value to two positions in global memory
    int offset = threadIdx.x + blockDim.x;
    if (address < n) {
        g_data[address] += uni;
    }
    if (offset < n) {
        g_data[address + blockDim.x] += uni;
    }
}