#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void unpack_bottom(const int x, const int y, const int halo_depth, double* field, double* buffer, const int depth)
{
    const int x_inner = x - 2 * halo_depth;

    // Use grid stride loop for better scalability
    for (int gid = threadIdx.x + blockDim.x * blockIdx.x; gid < x_inner * depth; gid += blockDim.x * gridDim.x) 
    {
        const int lines = gid / x_inner;
        const int offset = x * (halo_depth - depth) + lines * 2 * halo_depth;
        field[offset + gid] = buffer[gid];
    }
}