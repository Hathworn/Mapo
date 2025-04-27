#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeUnroll4Row(float *out, float *in, const int nx, const int ny)
{
    // Calculate global row and column indices
    unsigned int ix = blockIdx.x * (blockDim.x * 4) + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    if (ix + 3 * blockDim.x < nx && iy < ny)
    {
        unsigned int ti = iy * nx + ix; // Compute input index for row-major access
        unsigned int to = ix * ny + iy; // Compute output index for column-major access

        // Copy 4 elements in a coalesced manner
        out[to] = in[ti];
        out[to + ny * blockDim.x] = in[ti + blockDim.x];
        out[to + ny * 2 * blockDim.x] = in[ti + 2 * blockDim.x];
        out[to + ny * 3 * blockDim.x] = in[ti + 3 * blockDim.x];
    }
}