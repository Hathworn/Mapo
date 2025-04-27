#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniformAdd(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex) 
{
    __shared__ int uni;
    
    // Load uniforms value into shared memory
    if (threadIdx.x == 0) {
        uni = uniforms[blockIdx.x + blockOffset];
    }

    // Calculate global memory address
    unsigned int address = blockIdx.x * blockDim.x * 2 + baseIndex + threadIdx.x;

    __syncthreads();

    // Perform uniform add
    if (address < n) {
        g_data[address] += uni;
        if (address + blockDim.x < n) {
            g_data[address + blockDim.x] += uni;
        }
    }
}