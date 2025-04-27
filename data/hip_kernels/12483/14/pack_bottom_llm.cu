#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pack_bottom(const int x, const int y, const int halo_depth, double* field, double* buffer, const int depth)
{
    const int x_inner = x - 2 * halo_depth;

    // Calculate 2D index for improved memory coalescing
    int gid_x = threadIdx.x + blockIdx.x * blockDim.x;
    int gid_y = threadIdx.y + blockIdx.y * blockDim.y;

    // Check bounds in 2D space
    if (gid_x >= x_inner || gid_y >= depth) return;

    // Calculate global index in 1D
    int gid = gid_y * x_inner + gid_x; 

    // Compute field offset
    int offset = x * halo_depth + gid_y * 2 * halo_depth;
    buffer[gid] = field[offset + gid];
}