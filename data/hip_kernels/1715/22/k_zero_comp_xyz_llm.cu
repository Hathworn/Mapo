#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void k_zero_comp_xyz(float *data, uint n, uint stride)
{
    // Using combined x and y dimensions for indexing
    uint idx = blockIdx.y * blockDim.x * gridDim.x + blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < n * gridDim.y) {
        data[idx] = 0.f;
    }
}