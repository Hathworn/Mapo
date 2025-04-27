#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex) {
    __shared__ float uni;
    if (threadIdx.x == 0)
        uni = uniforms[blockIdx.x + blockOffset];

    // Use blockDim.x for efficient calculation of address
    unsigned int address = blockIdx.x * (blockDim.x << 1) + baseIndex + threadIdx.x;

    __syncthreads();
    
    // Use local variable to avoid redundant global memory access
    float local_uni = uni;

    // Perform adds more efficiently
    g_data[address] += local_uni;
    if (threadIdx.x + blockDim.x < n)
        g_data[address + blockDim.x] += local_uni;
}