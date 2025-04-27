#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex) {
    __shared__ float uni;
    
    // Load uniform value into shared memory by the first thread in block
    if (threadIdx.x == 0) {
        uni = uniforms[blockIdx.x + blockOffset];
    }
    
    // Calculate global memory address
    unsigned int address = blockIdx.x * (blockDim.x << 1) + baseIndex + threadIdx.x;
    
    __syncthreads();
    
    // Use conditional operator directly in index to avoid branching
    g_data[address] += uni;
    if (threadIdx.x + blockDim.x < n) {
        g_data[address + blockDim.x] += uni;
    }
}