#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeDiagonalCol(float *out, float *in, const int nx, const int ny)
{
    // Optimize block and thread index calculation for better performance
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Boundary check to ensure indices are within matrix limits
    if (ix < nx && iy < ny)
    {
        // Transpose operation
        out[iy * nx + ix] = in[ix * ny + iy];
    }
}