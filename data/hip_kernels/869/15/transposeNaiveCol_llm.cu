#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeNaiveCol(float *out, float *in, const int nx, const int ny)
{
    // Calculate the thread's unique global index.
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure indices are within matrix bounds.
    if (ix < nx && iy < ny)
    {
        // Perform matrix transposition.
        out[ix * ny + iy] = in[iy * nx + ix];
    }
}