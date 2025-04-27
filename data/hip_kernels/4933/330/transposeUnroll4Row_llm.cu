#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeUnroll4Row(int *in, int *out, const int nx, const int ny)
{
    // Calculate thread id with consideration of warp granularity
    unsigned int ix = (threadIdx.x + blockIdx.x * blockDim.x) * 4;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;

    if (ix < nx - 3 * blockDim.x && iy < ny) // Check with optimized boundary condition
    {
        unsigned int ti = iy * nx + ix; // Access in rows
        unsigned int to = ix * ny + iy; // Access in cols

        // Unrolling loads for improved coalescing
        int temp0 = in[ti];
        int temp1 = in[ti + blockDim.x];
        int temp2 = in[ti + blockDim.x * 2];
        int temp3 = in[ti + blockDim.x * 3];

        // Unrolling stores
        out[to] = temp0;
        out[to + ny * blockDim.x] = temp1;
        out[to + ny * blockDim.x * 2] = temp2;
        out[to + ny * blockDim.x * 3] = temp3;
    }
}