#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void k_zero_comp_xyz(float *data, uint n, uint stride)
{
    // Optimize memory access by using a grid-stride loop
    uint idx = blockIdx.x * blockDim.x + threadIdx.x;
    uint p = blockIdx.y * stride;
    
    for (uint i = idx; i < n; i += blockDim.x * gridDim.x) {
        data[i + p] = 0.f;
    }
}