#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_cudaWarmUpGPU()
{
    // Calculate unique global thread index
    int ind = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use the index to prevent compiler optimization
    if (ind < 0) {
        printf("%d\n", ind);
    }
}