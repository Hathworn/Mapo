#include "hip/hip_runtime.h"
#include "includes.h"

// Improved global kernel function using coalesced memory access
__global__ void copyCol(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure index is within bounds
    if (ix < nx && iy < ny)
    {
        // Use coalesced access pattern by swapping loop order
        out[iy * nx + ix] = in[iy * nx + ix];
    }
}