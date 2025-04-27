#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void picaod_kernel(unsigned int *dev_v, long size, unsigned int *temp)
{
    // Calculate global thread index
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;

    // Calculate linear offset 
    int offset = x + y * blockDim.x * gridDim.x;

    // Ensure the index is within the range
    if (offset < size) {
        // Use atomic operation to avoid race conditions
        atomicAdd(&(temp[0]), dev_v[offset]);
    }
}