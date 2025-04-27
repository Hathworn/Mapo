#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeNaiveCol(float *out, float *in, const int nx, const int ny)
{
    // Compute the global row and column indices
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure threads do not run beyond matrix dimensions
    if (ix < nx && iy < ny)
    {
        // Perform the transposition operation
        out[iy * nx + ix] = in[ix * ny + iy];
    }
}