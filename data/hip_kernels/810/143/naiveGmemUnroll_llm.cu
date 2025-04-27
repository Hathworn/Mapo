#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void naiveGmemUnroll(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = 2 * blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    unsigned int ti = iy * nx + ix;
    unsigned int to = ix * ny + iy;

    if (ix < nx && iy < ny) // Ensure threads within bounds
    {
        out[to] = in[ti];
        if (ix + blockDim.x < nx) // Second read only if within bounds
        {
            out[to + ny * blockDim.x] = in[ti + blockDim.x];
        }
    }
}