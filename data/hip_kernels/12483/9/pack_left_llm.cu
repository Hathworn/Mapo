#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pack_left(const int x, const int y, const int halo_depth, double* field, double* buffer, const int depth)
{
    const int y_inner = y - 2 * halo_depth;
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit for out-of-bounds threads
    if (gid >= y_inner * depth) return;

    // Calculate the line index
    const int line = gid / depth;
    
    // Compute the offset using line and thread index
    const int offset = halo_depth + line * x + (gid % depth);

    buffer[gid] = field[offset];
}