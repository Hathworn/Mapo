#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeDiagonalColUnroll4(float *out, float *in, const int nx, const int ny)
{
    unsigned int blk_idx = blockIdx.x + blockIdx.y * gridDim.x;
    unsigned int ix_stride = blockDim.x * gridDim.x;
    unsigned int ix = blk_idx * blockDim.x * 4 + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure thread index calculations do not exceed boundaries
    if (iy < ny)
    {
        if (ix < nx) out[iy * nx + ix] = in[ix * ny + iy];
        if (ix + blockDim.x < nx) out[iy * nx + ix + blockDim.x] = in[(ix + blockDim.x) * ny + iy];
        if (ix + 2 * blockDim.x < nx) out[iy * nx + ix + 2 * blockDim.x] = in[(ix + 2 * blockDim.x) * ny + iy];
        if (ix + 3 * blockDim.x < nx) out[iy * nx + ix + 3 * blockDim.x] = in[(ix + 3 * blockDim.x) * ny + iy];
    }
}