#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void createLookupKernel(const int* inds, int total, int* output)
{
    // Calculate global thread index once
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to reduce global memory access if needed
    if (idx < total)
    {
        int index = inds[idx];
        output[index] = idx;
    }
}