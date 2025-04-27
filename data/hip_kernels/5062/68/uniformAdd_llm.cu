#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex) {
    __shared__ float uni;
    if (threadIdx.x == 0) {
        // Load uniform value once per block
        uni = uniforms[blockIdx.x + blockOffset];
    }

    unsigned int address = blockIdx.x * (blockDim.x << 1) + baseIndex + threadIdx.x;

    __syncthreads();

    // Add uniform to both addresses handled by this thread
    if (address < n) {
        g_data[address] += uni;
    }
    if (address + blockDim.x < n) {
        g_data[address + blockDim.x] += uni;
    }
}