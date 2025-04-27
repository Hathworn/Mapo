#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_copy_kernel(int size, float *src, float *dst)
{
    // Calculate index using a single expression for better readability
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Using shared memory to improve performance by reducing global memory access
    __shared__ float shared_mem[256];

    if (index < size)
    {
        // Load from global to shared memory
        shared_mem[threadIdx.x] = src[index];
        __syncthreads();

        // Store from shared to global memory
        dst[index] = shared_mem[threadIdx.x];
    }
}