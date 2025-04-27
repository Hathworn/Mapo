#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeNaiveCol(float *out, float *in, const int nx, const int ny)
{
    // Calculate global thread index in x and y directions
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;
    
    // Ensure within bounds to avoid unnecessary execution and out of bounds access
    if (ix < nx && iy < ny)
    {
        // Efficient coalesced global memory access pattern
        out[ix * ny + iy] = in[iy * nx + ix];
    }
}