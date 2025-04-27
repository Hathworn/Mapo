#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_cudaWarmUpGPU()
{
    // Compute the global index
    int ind = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure all threads reach this point
    __syncthreads();
}