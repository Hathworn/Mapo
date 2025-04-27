#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex)
{
    __shared__ int uni;
    
    // Load uniform value into shared memory
    if (threadIdx.x == 0)
        uni = uniforms[blockIdx.x + blockOffset];

    __syncthreads();

    unsigned int address = (blockIdx.x * blockDim.x * 2) + baseIndex + threadIdx.x;

    // Perform addition if within bounds
    if (address < n) {
        g_data[address] += uni;
    }

    if (address + blockDim.x < n) {
        g_data[address + blockDim.x] += uni;
    }
}