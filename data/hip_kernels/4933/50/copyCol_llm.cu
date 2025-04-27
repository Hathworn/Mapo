#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyCol(float *out, float *in, const int nx, const int ny)
{
    // Compute global linear index to improve memory access pattern
    unsigned int idx = blockDim.x * blockIdx.x + threadIdx.x + (blockDim.y * blockIdx.y + threadIdx.y) * nx;

    // Check bounds and copy column directly using linear index
    if (idx < nx * ny)
    {
        out[idx] = in[idx];
    }
}