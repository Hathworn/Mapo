#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel to warm up the GPU
__global__ void kernel_cudaWarmUpGPU()
{
    // Calculate global thread index
    int ind = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Perform a no-op calculation to prevent compiler optimizations
    if (ind) {
        ind = ind + 1;
    }
}