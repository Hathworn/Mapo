#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeNaiveRow(float *out, float *in, const int nx, const int ny)
{
    // Calculate the row and column indices within the grid
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Only execute if within bounds
    if (ix < nx && iy < ny)
    {
        // Perform the transpose, leveraging memory coalescing
        out[iy * nx + ix] = in[ix * ny + iy];
    }
}