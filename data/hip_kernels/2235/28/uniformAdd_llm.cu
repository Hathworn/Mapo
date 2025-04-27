#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex) {
    // Load uniform value to shared memory for each block
    __shared__ float uni;
    if (threadIdx.x == 0) {
        uni = uniforms[blockIdx.x + blockOffset];
    }

    // Calculate global index
    unsigned int address = blockIdx.x * (blockDim.x << 1) + baseIndex + threadIdx.x;

    // Ensure previous stores to shared memory are visible to threads
    __syncthreads();
    
    // Perform addition if within bounds
    if (address < n) {
        g_data[address] += uni;
    }
    
    // Execute second addition only for valid threads
    unsigned int secondAddress = address + blockDim.x;
    if (secondAddress < n) {
        g_data[secondAddress] += uni;
    }
}