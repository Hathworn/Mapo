#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_cudaWarmUpGPU()
{
    // Calculate global thread index
    int ind = blockIdx.x * blockDim.x + threadIdx.x;

    // No operation needed but ensure the thread is being used to prevent optimization
    asm volatile(""); // Compiler barrier to prevent removal of ind
}