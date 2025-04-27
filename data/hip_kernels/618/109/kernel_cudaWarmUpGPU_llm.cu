#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel for CUDA warm-up
__global__ void kernel_cudaWarmUpGPU()
{
    // Calculate global thread index
    int ind = blockIdx.x * blockDim.x + threadIdx.x;

    // Use the index for warm-up computation to ensure it doesn't get optimized away
    if (ind < 1) // Single-thread execution for validation
    {
        // Volatile variable to prevent optimization
        volatile int warmUp = ind + 1;
    }
}