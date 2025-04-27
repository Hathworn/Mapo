#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeUnroll4Col(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockDim.x * blockIdx.x * 4 + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Accessing input and output with coalesced memory access pattern
    if (ix + 3 * blockDim.x < nx && iy < ny)
    {
        const unsigned int ti = iy * nx + ix;
        const unsigned int to = ix * ny + iy;
        
        float temp0 = in[to];
        float temp1 = in[to + blockDim.x * ny];
        float temp2 = in[to + 2 * blockDim.x * ny];
        float temp3 = in[to + 3 * blockDim.x * ny];

        out[ti]                = temp0;
        out[ti +   blockDim.x] = temp1;
        out[ti + 2 * blockDim.x] = temp2;
        out[ti + 3 * blockDim.x] = temp3;
    }
}