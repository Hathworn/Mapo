#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex) {
    // Use thread block reduction instead of single thread for loading
    __shared__ float uni;
    if (threadIdx.x == 0) {
        uni = uniforms[blockIdx.x + blockOffset];
    }
    __syncthreads();

    unsigned int address = blockIdx.x * (blockDim.x << 1) + baseIndex + threadIdx.x;

    // Perform one addition safely and possibly skip the second
    if (address < n) {
        g_data[address] += uni;
    }
    if (address + blockDim.x < n) {
        g_data[address + blockDim.x] += uni;
    }
}