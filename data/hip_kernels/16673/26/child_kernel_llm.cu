#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void child_kernel(int *data, int seed)
{
    // Calculate global index only once
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within bounds to avoid out-of-bounds memory access
    if (idx < gridDim.x * blockDim.x) {
        atomicAdd(&data[idx], seed);
    }
}