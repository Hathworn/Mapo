#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void naiveGmemUnroll(float *out, float *in, const int nx, const int ny)
{
    // Calculate global indices with unrolling
    unsigned int ix = 2 * blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate linear indices for input and output
    unsigned int ti = iy * nx + ix;
    unsigned int to = ix * ny + iy;

    // Optimize boundary checks to prevent redundant computations
    if (iy < ny && ix + blockDim.x < nx)
    {
        // Unrolled assignments for adjacent elements
        out[to]                  = in[ti];
        out[to + ny * blockDim.x] = in[ti + blockDim.x];
    }
}