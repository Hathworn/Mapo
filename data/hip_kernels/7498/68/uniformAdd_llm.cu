#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex) {
    __shared__ float uni;
    
    // Load uniform value to shared memory
    if (threadIdx.x == 0)
        uni = uniforms[blockIdx.x + blockOffset];
    
    unsigned int address = blockIdx.x * (blockDim.x << 1) + baseIndex + threadIdx.x; // Use standard multiplication

    __syncthreads();

    // Add uniform value to two locations in global memory per thread
    if (address < n) {
        g_data[address] += uni;
    }

    if (address + blockDim.x < n) {
        g_data[address + blockDim.x] += uni;
    }
}