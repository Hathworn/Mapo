#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void naiveGmem(float *out, float *in, const int nx, const int ny)
{
    // Calculate global thread index for the output and input
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Precompute linear index for better memory coalescing
    unsigned int outIdx = ix * ny + iy;
    unsigned int inIdx = iy * nx + ix;

    // Transpose with boundary check
    if (ix < nx && iy < ny)
    {
        out[outIdx] = in[inIdx]; // Direct array index usage
    }
}