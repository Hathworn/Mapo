#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeUnroll4Col(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = (blockDim.x * blockIdx.x + threadIdx.x) * 4;  // Unroll adjustment
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    if (ix < nx && iy < ny)
    {
        unsigned int ti = iy * nx + ix; // access in rows
        unsigned int to = ix * ny + iy; // access in columns
        
        // Simplify by using variables for offsets
        float in0 = in[to];
        float in1 = in[to + ny];
        float in2 = in[to + 2 * ny];
        float in3 = in[to + 3 * ny];
        
        out[ti]                = in0;
        out[ti +   blockDim.x] = in1;
        out[ti + 2 * blockDim.x] = in2;
        out[ti + 3 * blockDim.x] = in3;
    }
}