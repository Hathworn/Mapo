#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex) {
    __shared__ float uni;
    if (threadIdx.x == 0)
        uni = uniforms[blockIdx.x + blockOffset];
    
    __syncthreads();

    // Use blockIdx.x * blockDim.x * 2 instead of deprecated __mul24
    unsigned int address = blockIdx.x * (blockDim.x << 1) + baseIndex + threadIdx.x;

    // Perform the adds with conditional check for boundary
    if (address < n) {
        g_data[address] += uni;
    }
    if (address + blockDim.x < n) {
        g_data[address + blockDim.x] += uni;
    }
}