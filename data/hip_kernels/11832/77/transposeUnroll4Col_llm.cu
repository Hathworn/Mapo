#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeUnroll4Col(float *out, float *in, const int nx, const int ny)
{
    // Calculate global thread coordinates
    unsigned int ix = blockIdx.x * blockDim.x * 4 + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate matrix indices
    unsigned int ti = iy * nx + ix;
    unsigned int to = ix * ny + iy;

    // Optimization: Check boundaries once to reduce divergence
    if (ix < nx - 3 * blockDim.x && iy < ny)
    {
        // Use registers to reduce global memory access
        float4 data;
        data.x = in[to];
        data.y = in[to + blockDim.x * ny];
        data.z = in[to + 2 * blockDim.x * ny];
        data.w = in[to + 3 * blockDim.x * ny];

        // Write to output in burst mode
        out[ti] = data.x;
        out[ti + blockDim.x] = data.y;
        out[ti + 2 * blockDim.x] = data.z;
        out[ti + 3 * blockDim.x] = data.w;
    }
}