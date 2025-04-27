#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyCol(float *out, float *in, const int nx, const int ny)
{
    // Calculate linear index for improved memory access
    unsigned int idx = blockIdx.y * blockDim.y * nx + blockIdx.x * blockDim.x + threadIdx.y * nx + threadIdx.x;

    if (blockIdx.x * blockDim.x + threadIdx.x < nx && blockIdx.y * blockDim.y + threadIdx.y < ny)
    {
        // Efficiently copy the element using linear index
        out[idx] = in[idx];
    }
}