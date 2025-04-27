#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex)
{
    __shared__ int uni;

    // Load the uniform value only once into shared memory by the first thread
    if (threadIdx.x == 0) {
        uni = uniforms[blockIdx.x + blockOffset];
    }
    
    __syncthreads(); // Ensure uniform value is loaded before proceeding

    // Optimize address calculation using intrinsic function
    unsigned int address = __fma_rn(blockIdx.x, (blockDim.x << 1), baseIndex + threadIdx.x);

    // Update g_data array with the value in shared memory
    g_data[address] += uni;
    if (threadIdx.x + blockDim.x < n) {
        g_data[address + blockDim.x] += uni;
    }
}