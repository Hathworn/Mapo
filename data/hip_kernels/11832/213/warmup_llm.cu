#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float *out, float *in, const int nx, const int ny)
{
    // Calculate global thread index
    unsigned int idx = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int idy = blockDim.y * blockIdx.y + threadIdx.y;

    // Use a direct index calculation
    unsigned int index = idy * nx + idx;

    // Prevent out-of-bounds access
    if (idx < nx && idy < ny)
    {
        out[index] = in[index];
    }
}