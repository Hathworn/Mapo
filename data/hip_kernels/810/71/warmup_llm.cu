#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float *out, float *in, const int nx, const int ny)
{
    // Calculate global thread index
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Linearize 2D block index fetching
    unsigned int idx = iy * nx + ix;

    // Only compute valid indices
    if (ix < nx && iy < ny)
    {
        out[idx] = in[idx];
    }
}