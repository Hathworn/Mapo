#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeNaiveCol(float *out, float *in, const int nx, const int ny)
{
    // Compute combined column-major index
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Perform bounds check only after computing indices
    if (ix < nx && iy < ny)
    {
        // Coalesced memory access pattern by writing in row-major order
        out[ix * ny + iy] = in[iy * nx + ix];
    }
}