#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pack_right(const int x, const int y, const int halo_depth, double* field, double* buffer, const int depth)
{
    // Efficient calculation of global thread ID
    const int gid = threadIdx.x + blockDim.x * blockIdx.x;
    const int y_inner = y - 2 * halo_depth;

    // Early exit for threads outside the bounds
    if (gid >= y_inner * depth) return;

    // Directly calculate the field index
    const int lines = gid / depth;
    const int offset = lines * x + halo_depth + depth - x;
    buffer[gid] = field[offset + gid];
}