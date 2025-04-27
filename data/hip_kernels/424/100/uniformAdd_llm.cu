#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex)
{
    __shared__ int uni;
    if (threadIdx.x == 0)
        uni = uniforms[blockIdx.x + blockOffset];

    unsigned int address = blockIdx.x * (blockDim.x << 1) + baseIndex + threadIdx.x;

    __syncthreads();

    // Simplified addressing and removed unnecessary conditional
    g_data[address] += uni;
    if (threadIdx.x + blockDim.x < n) // Avoid unnecessary multiplication
        g_data[address + blockDim.x] += uni;
}