#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_cudaWarmUpGPU()
{
    // Use volatile to prevent compiler optimization from removing the operation
    volatile int ind = blockIdx.x * blockDim.x + threadIdx.x;
    ind = ind + 1; // Simple increment operation to engage the GPU
}