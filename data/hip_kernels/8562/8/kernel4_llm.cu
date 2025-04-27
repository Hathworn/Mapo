#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel4(int *a, int dimx, int dimy)
{
    // Calculate flattened global thread index
    int idx = blockIdx.y * blockDim.y * dimx + blockIdx.x * blockDim.x + threadIdx.y * dimx + threadIdx.x;

    // Check bounds and update the array
    if (blockIdx.x * blockDim.x + threadIdx.x < dimx && blockIdx.y * blockDim.y + threadIdx.y < dimy)
        a[idx] = (threadIdx.y * blockDim.x) + threadIdx.x;
}