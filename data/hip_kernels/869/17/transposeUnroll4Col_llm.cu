#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeUnroll4Col(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = (blockDim.x * blockIdx.x + threadIdx.x) * 4; // Calculate ix with unrolled factor
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    unsigned int ti = iy * nx + ix; // access in rows
    unsigned int to = ix * ny + iy; // access in columns

    if (ix + 3 < nx && iy < ny) // Ensure ix and iy are within bounds
    {
        // Efficient memory fetch and store using unrolling
        float4 data;
        data.x = in[to];
        data.y = in[to + ny];
        data.z = in[to + 2 * ny];
        data.w = in[to + 3 * ny];

        out[ti] = data.x;
        out[ti + blockDim.x] = data.y;
        out[ti + 2 * blockDim.x] = data.z;
        out[ti + 3 * blockDim.x] = data.w;
    }
}