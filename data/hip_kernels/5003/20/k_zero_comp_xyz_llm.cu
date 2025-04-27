#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void k_zero_comp_xyz(float *data, uint n, uint stride)
{
    // Calculate global index for 2D grid
    uint globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (globalIdx < n) {
        // Calculate the offset for the second dimension
        data[globalIdx + blockIdx.y * stride] = 0.f;
    }
}