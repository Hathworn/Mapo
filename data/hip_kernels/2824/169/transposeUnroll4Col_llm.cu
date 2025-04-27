#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeUnroll4Col(float *out, float *in, const int nx, const int ny)
{
    // Compute global thread indices
    unsigned int ix = blockDim.x * blockIdx.x * 4 + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Compute input and output index
    unsigned int ti = iy * nx + ix; // access in rows
    unsigned int to = ix * ny + iy; // access in columns

    // Optimize memory access with coalesced reads and unroll
    if (ix + 3 * blockDim.x < nx && iy < ny)
    {
        float in1 = in[to];
        float in2 = in[to + blockDim.x * ny];
        float in3 = in[to + 2 * blockDim.x * ny];
        float in4 = in[to + 3 * blockDim.x * ny];

        out[ti] = in1;
        out[ti + blockDim.x] = in2;
        out[ti + 2 * blockDim.x] = in3;
        out[ti + 3 * blockDim.x] = in4;
    }
}