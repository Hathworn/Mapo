```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex)
{
    __shared__ int uni;
    
    // Load uniforms to shared memory only once per block
    if (threadIdx.x == 0)
        uni = uniforms[blockIdx.x + blockOffset];

    // Calculate global thread address
    unsigned int address = blockIdx.x * (blockDim.x << 1) + baseIndex + threadIdx.x;

    __syncthreads();

    // Update data with uniform value; check address bounds for second add
    g_data[address] += uni;
    if (threadIdx.x + blockDim.x < n)
        g_data[address + blockDim.x] += uni;
}