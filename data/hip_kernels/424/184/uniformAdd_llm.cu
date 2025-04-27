#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex)
{
    __shared__ int uni;
    if (threadIdx.x == 0)
        uni = uniforms[blockIdx.x + blockOffset];

    // Better indexing with simpler operations
    unsigned int address = blockIdx.x * (blockDim.x << 1) + baseIndex + threadIdx.x;

    __syncthreads();
    
    // Use conditional with a unified index calculation
    if (address < n) {
        g_data[address] += uni;
    }
    if (address + blockDim.x < n) {
        g_data[address + blockDim.x] += uni;
    }
}