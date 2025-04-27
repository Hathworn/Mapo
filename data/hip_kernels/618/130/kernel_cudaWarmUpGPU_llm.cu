#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_cudaWarmUpGPU()
{
    // Calculate unique thread index more efficiently
    int ind = blockIdx.x * blockDim.x + threadIdx.x;
    if (ind < blockDim.x * gridDim.x) {
        // Perform a simple operation to warm up the GPU
        ind++; // This line just to avoid compiler optimizations
    }
}