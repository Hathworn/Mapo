#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyRow(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure the index is within bounds before copying
    if (ix < nx && iy < ny) 
    {
        out[iy * nx + ix] = in[iy * nx + ix];
    }
}