#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_cudaWarmUpGPU()
{
    // Calculate global thread index
    int ind = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop to utilize and keep GPU active
    for (int i = 0; i < 1000; i++) {
        ind = ind + 1; // Simple operation to keep activity
    }
}