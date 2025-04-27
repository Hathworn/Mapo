#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeUnroll8Row(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockDim.x * blockIdx.x * 8 + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    unsigned int ti = iy * nx + ix; // access in rows
    unsigned int to = ix * ny + iy; // access in columns

    // Ensure enough threads are launched to cover the rows in x
    if (ix < nx && iy < ny)
    {
        #pragma unroll
        for (int i = 0; i < 8 && ix + i * blockDim.x < nx; ++i)
        {
            out[to + i * ny * blockDim.x] = in[ti + i * blockDim.x];
        }
    }
}