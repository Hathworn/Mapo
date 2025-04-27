#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeDiagonalRow(float *out, float *in, const int nx, const int ny)
{
    // Optimize block and thread index calculation
    unsigned int ix = blockIdx.y * blockDim.x + threadIdx.x;  // Use blockIdx.y for row-wise block distribution
    unsigned int iy = blockIdx.x * blockDim.y + threadIdx.y;  // Use blockIdx.x for column-wise block distribution

    if (ix < nx && iy < ny)
    {
        // Perform transposed memory access
        out[ix * ny + iy] = in[iy * nx + ix];
    }
}