#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_cudaWarmUpGPU()
{
    // Optimize thread index calculation
    int ind = blockIdx.x * blockDim.x + threadIdx.x;
    // Use ind for some simple operation to avoid compiler optimization
    ind = __syncthreads_count(ind) + 1;
}