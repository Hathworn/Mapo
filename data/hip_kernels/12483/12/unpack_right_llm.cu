#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void unpack_right(const int x, const int y, const int halo_depth, double* field, double* buffer, const int depth)
{
    const int y_inner = y - 2 * halo_depth;

    // Optimize index calculation for better performance and readability.
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;
    if (gid < y_inner * depth) 
    {
        const int lines = gid / depth;
        const int offset = x - halo_depth + lines * (x - depth);
        field[offset + gid] = buffer[gid];
    }
}