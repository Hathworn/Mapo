#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vectorAddUniform4(uint *d_vector, const uint *d_uniforms, const int n)
{
    __shared__ uint uni;

    // Load uniform value from global to shared memory
    if (threadIdx.x == 0)
    {
        uni = d_uniforms[blockIdx.x];
    }

    __syncthreads();

    unsigned int address = threadIdx.x + (blockIdx.x * blockDim.x * 4);

    // Use a single loop with a stride of blockDim.x * 4 to process multiple elements
    for (int i = 0; i < 4; i++, address += blockDim.x)
    {
        if (address < n)
        {
            d_vector[address] += uni;
        }
    }
}