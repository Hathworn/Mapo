#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_cudaWarmUpGPU()
{
    // Calculate global thread index
    int ind = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform a no-op to warm up GPU
    if (ind < 1) // Optimize with a condition, though here it's a warm-up example
    {
        ind += 1;
    }
}