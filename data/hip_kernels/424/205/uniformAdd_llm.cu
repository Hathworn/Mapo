#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex)
{
    __shared__ int uni;
    // Load the uniform into shared memory only once per block
    if (threadIdx.x == 0)
        uni = uniforms[blockIdx.x + blockOffset];

    __syncthreads(); // Ensure the uniform value is loaded before use

    unsigned int address = blockIdx.x * (blockDim.x << 1) + baseIndex + threadIdx.x;

    // Use logical AND to prevent out-of-bound access and reduce branch divergence
    if (threadIdx.x + blockDim.x < n) {
        g_data[address]              += uni;
        g_data[address + blockDim.x] += uni;
    } else {
        g_data[address] += uni;
    }
}