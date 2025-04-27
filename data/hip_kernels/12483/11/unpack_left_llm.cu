#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void unpack_left(const int x, const int y, const int halo_depth, double* __restrict__ field, const double* __restrict__ buffer, const int depth)
{
    const int y_inner = y - 2 * halo_depth;
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Terminate early if thread index exceeds bounds
    if (gid >= y_inner * depth) return;

    // Calculate index using divide operation once and offset with computed index directly
    const int offset_base = halo_depth - depth + (gid / depth) * (x - depth);
    field[offset_base + gid % depth] = buffer[gid];
}