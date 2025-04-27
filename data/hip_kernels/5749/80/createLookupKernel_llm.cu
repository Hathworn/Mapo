#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void createLookupKernel(const int* inds, int total, int* output)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread index is within bounds
    if (idx >= total) return;
    
    // Use atomic operation to prevent write conflicts
    atomicExch(&output[inds[idx]], idx);
}