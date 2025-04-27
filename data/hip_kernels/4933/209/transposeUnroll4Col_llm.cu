#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeUnroll4Col(float *out, float *in, const int nx, const int ny)
{
    // Calculate thread's global indices
    unsigned int ix = blockDim.x * blockIdx.x * 4 + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Compute indexes for input and output with row and column access
    unsigned int ti = iy * nx + ix; 
    unsigned int to = ix * ny + iy; 

    // Check boundaries and perform loop unrolling for optimized memory access
    if (ix + 3 * blockDim.x < nx && iy < ny)
    {
        #pragma unroll 4
        for (int i = 0; i < 4; i++)
        {
            unsigned int idx_out = ti + i * blockDim.x;
            unsigned int idx_in = to + i * blockDim.x * ny;
            out[idx_out] = in[idx_in];
        }
    }
}