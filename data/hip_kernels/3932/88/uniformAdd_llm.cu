#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex) {
    __shared__ float uni;
    
    // Load uni value from global to shared memory by the first thread in the block
    if (threadIdx.x == 0)
        uni = uniforms[blockIdx.x + blockOffset];
    
    __syncthreads(); // Ensure that the shared memory is updated before proceeding

    unsigned int address = blockIdx.x * (blockDim.x << 1) + baseIndex + threadIdx.x;

    // Optimize by reducing condition check in g_data[address + blockDim.x] update
    if (address < n) {
        g_data[address] += uni;
        if (address + blockDim.x < n)
            g_data[address + blockDim.x] += uni;
    }
}