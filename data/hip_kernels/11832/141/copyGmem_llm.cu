#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copyGmem(float *out, float *in, const int nx, const int ny)
{
    // matrix coordinate (ix,iy)
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // transpose with boundary check
    if (ix < nx && iy < ny)
    {
        // Optimized memory access pattern
        out[iy * nx + ix] = in[iy * nx + ix];
    }
}