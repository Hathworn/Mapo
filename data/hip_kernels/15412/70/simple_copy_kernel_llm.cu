#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_copy_kernel(int size, float *src, float *dst)
{
    // Use shared memory to optimize global memory access
    __shared__ float cache[256];  // Adjust size as needed

    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int cacheIndex = threadIdx.x;
    
    // Load elements from global to shared memory, avoiding out-of-bounds access
    if (index < size)
    {
        cache[cacheIndex] = src[index];
    }
    
    __syncthreads(); // Ensure all loads to shared memory are complete

    // Write elements from shared to global memory
    if (index < size)
    {
        dst[index] = cache[cacheIndex];
    }
}