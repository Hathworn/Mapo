#include "hip/hip_runtime.h"
#include "includes.h"

#define blockx 16
#define blocky 16

__global__ void _kernel_clearsuna_EFG(int num_slices, int num_grid, float* dev_EFG)
{
    // Compute flattened thread index for better memory coalescing
    uint index = blockIdx.x * blockDim.x + threadIdx.x 
               + (blockIdx.y * blockDim.y + threadIdx.y) * num_grid 
               + blockIdx.z * num_grid * num_grid;

    // Only proceed if the index is within the bounds
    if (index < (num_slices * num_grid * num_grid)) {
        dev_EFG[index] = 0.0;
    }
}