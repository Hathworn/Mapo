#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING : device_sum size should be gridDim.x
__global__ void vec_initIndex(int n, int *index)
{
    // Calculate flattened thread index in grid
    int id = blockIdx.x * blockDim.x + threadIdx.x + 
             (blockIdx.y * blockDim.y + threadIdx.y) * gridDim.x * blockDim.x;

    // Check bounds and initialize index
    if (id < n)
    {
        index[id] = id;
    }
}