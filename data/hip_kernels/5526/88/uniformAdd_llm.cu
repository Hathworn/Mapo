#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex) {
    __shared__ float uni;

    // Load uniform value into shared memory by the first thread of the block
    if (threadIdx.x == 0)
        uni = uniforms[blockIdx.x + blockOffset];

    // Compute global address using a more efficient calculation
    unsigned int address = blockIdx.x * (blockDim.x << 1) + baseIndex + threadIdx.x;

    // Ensure uniform value is loaded before proceeding
    __syncthreads();

    // Apply uniform addition if within bounds
    if (address < n) 
        g_data[address] += uni;

    // Apply second addition if within bounds
    if (address + blockDim.x < n) 
        g_data[address + blockDim.x] += uni;
}