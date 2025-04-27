#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeNaiveCol(float *out, float *in, const int nx, const int ny)
{
    // Calculate global index
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds to avoid redundant computations
    if (ix < nx && iy < ny)
    {
        // Perform the transpose operation
        out[iy * nx + ix] = in[ix * ny + iy];
    }
}