#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeUnroll4Col(int *in, int *out, const int nx, const int ny)
{
    // Set thread id.
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x * 4;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;

    // Calculate indices for accessing rows and columns
    unsigned int ti = iy * nx + ix; // Access in rows.
    unsigned int to = ix * ny + iy; // Access in cols.

    // Unroll the loop to optimize memory access
    if (ix + 3 * blockDim.x < nx && iy < ny)
    {
        // Use temporary variables to reduce repetitive calculations
        unsigned int step = ny * blockDim.x;
        out[ti]              = in[to];
        out[ti + blockDim.x] = in[to + step];
        out[ti + 2 * blockDim.x] = in[to + 2 * step];
        out[ti + 3 * blockDim.x] = in[to + 3 * step];
    }
}