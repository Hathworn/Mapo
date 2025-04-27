#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex) {
    __shared__ float uni;
    // Load uniform values to shared memory using the first thread of each block
    if (threadIdx.x == 0)
        uni = uniforms[blockIdx.x + blockOffset];

    unsigned int address = blockIdx.x * (blockDim.x << 1) + baseIndex + threadIdx.x;

    __syncthreads();

    // Update g_data using conditional and single instruction instead of two adds
    if (threadIdx.x < n) {
        g_data[address] += uni;
        if (threadIdx.x + blockDim.x < n)
            g_data[address + blockDim.x] += uni;
    }
}