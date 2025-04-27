#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void naiveGmem(float *out, float *in, const int nx, const int ny)
{
    // matrix coordinate (ix,iy)
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Use shared memory for better memory access pattern
    // Threads will work on shared memory and write results back to global memory

    // Transpose with boundary test and write back to global memory
    if (ix < nx && iy < ny)
    {
        out[ix * ny + iy] = in[iy * nx + ix];
    }
}