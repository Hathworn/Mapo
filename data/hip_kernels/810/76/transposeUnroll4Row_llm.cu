#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeUnroll4Row(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockDim.x * blockIdx.x * 4 + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Precompute common index multiplications
    unsigned int block_offset = blockDim.x * ny;
    unsigned int ti = iy * nx + ix; // access in rows
    unsigned int to = ix * ny + iy; // access in columns

    // Unroll loop with boundary check outside the loop
    if (ix + 3 * blockDim.x < nx && iy < ny)
    {
        #pragma unroll
        for (int i = 0; i < 4; i++)
        {
            out[to + i * block_offset] = in[ti + i * blockDim.x];
        }
    }
}