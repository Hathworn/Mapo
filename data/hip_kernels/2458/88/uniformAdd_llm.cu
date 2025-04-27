#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex) {
    __shared__ float uni;
    // Load uniform value only once per block
    if (threadIdx.x == 0) {
        uni = uniforms[blockIdx.x + blockOffset];
    }
    
    unsigned int address = blockIdx.x * (blockDim.x * 2) + baseIndex + threadIdx.x;

    __syncthreads(); // Ensure uni is loaded before use

    // Perform two additions per thread with bounds check for second addition
    if (address < n) {
        g_data[address] += uni;
    }
    if (address + blockDim.x < n) {
        g_data[address + blockDim.x] += uni;
    }
}