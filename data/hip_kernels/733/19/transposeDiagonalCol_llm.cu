#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeDiagonalCol(float *out, float *in, const int nx, const int ny)
{
    // Calculate global thread index using optimized approach
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure indices are within bounds before performing operations
    if (ix < nx && iy < ny)
    {
        out[iy * nx + ix] = in[ix * ny + iy];
    }
}