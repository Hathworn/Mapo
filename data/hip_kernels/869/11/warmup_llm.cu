#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void warmup(float *out, float *in, const int nx, const int ny)
{
    // Calculate the unique thread index
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int idx = iy * nx + ix; // Flatten 2D index to 1D

    // Perform operation only if within array bounds
    if (ix < nx && iy < ny)
    {
        out[idx] = in[idx];
    }
}