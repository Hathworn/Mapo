#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex)
{
    __shared__ int uni;

    // Load uniforms value into shared memory once per block
    if (threadIdx.x == 0)
        uni = uniforms[blockIdx.x + blockOffset];
    __syncthreads();  // Ensure all threads have the updated value

    // Calculate the address with efficient multiplication
    unsigned int address = blockIdx.x * (blockDim.x << 1) + baseIndex + threadIdx.x;

    // Perform two adds per thread only if within bounds
    if (address < n) {
        g_data[address] += uni;
        if (address + blockDim.x < n)
            g_data[address + blockDim.x] += uni;
    }
}