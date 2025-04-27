```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void k_zero_comp_xyz(float* __restrict__ data, uint n, uint stride)
{
    uint i = blockIdx.x * blockDim.x + threadIdx.x;
    uint p = blockIdx.y;
    
    // Ensure the thread index does not exceed bounds
    if (i >= n) return;

    // Use a pointer to avoid repeated calculations
    float* data_ptr = data + p * stride;
    
    // Zero the data at computed index
    data_ptr[i] = 0.f;
}