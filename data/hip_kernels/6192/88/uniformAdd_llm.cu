#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex) {
    __shared__ float uni;
    // Load the uniform value only in the first thread
    if (threadIdx.x == 0) {
        uni = uniforms[blockIdx.x + blockOffset];
    }

    // Improved address calculation using atomic operations
    unsigned int address = (blockIdx.x * (blockDim.x << 1)) + baseIndex + threadIdx.x;

    __syncthreads(); // Ensure shared data is ready before proceeding

    // Avoid redundant computation with conditional logic
    g_data[address] += uni;
    if ((threadIdx.x + blockDim.x) < n) {
        g_data[address + blockDim.x] += uni;
    }
}