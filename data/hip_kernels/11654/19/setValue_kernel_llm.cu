#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setValue_kernel(int *vals, int N)
{
    // Calculate linear index using 3D grid and 3D blocks
    int idx = blockIdx.x * blockDim.x * blockDim.y * blockDim.z + 
              threadIdx.z * blockDim.x * blockDim.y + 
              threadIdx.y * blockDim.x + 
              threadIdx.x;

    // Check if within bounds and set value
    if (idx < N)
    {
        vals[idx] = idx;
    }
}