#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void createLookupKernel(const int* __restrict__ inds, int total, int* __restrict__ output)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    if (idx < total)
    {
        int index = inds[idx];
        // Use atomic operation to prevent race conditions
        atomicExch(&output[index], idx);
    }
}