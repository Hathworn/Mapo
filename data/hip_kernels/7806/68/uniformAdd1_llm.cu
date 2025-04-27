#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniformAdd1(int *g_data, int *uniforms, int n, int blockOffset, int baseIndex)
{
    __shared__ int uni;
    if (threadIdx.x == 0)
        uni = uniforms[blockIdx.x + blockOffset];
    __syncthreads(); // Ensure uni is loaded before proceeding

    unsigned int address = blockIdx.x * blockDim.x + baseIndex + threadIdx.x;

    if (address < n) // Boundary check for safety
    {
        g_data[address] += uni; // Perform addition at global memory address
    }
}